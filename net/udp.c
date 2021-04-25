// Copyright (c) 2012-2020 YAMAMOTO Masaya
// SPDX-License-Identifier: MIT

#include "types.h"
#include "defs.h"
#include "spinlock.h"
#include "common.h"
#include "net.h"
#include "ip.h"
#include "socket.h"

#define UDP_CB_TABLE_SIZE 16
#define UDP_SOURCE_PORT_MIN 49152
#define UDP_SOURCE_PORT_MAX 65535

struct udp_hdr {
    uint16_t sport;
    uint16_t dport;
    uint16_t len;
    uint16_t sum;
};

struct udp_queue_hdr {
    ip_addr_t addr;
    uint16_t port;
    uint16_t len;
    uint8_t data[0];
};

struct udp_cb {
    int used;
    struct netif *iface;
    uint16_t port;
    struct queue_head queue;
};

static struct spinlock udplock;
static struct udp_cb cb_table[UDP_CB_TABLE_SIZE];

void
udp_dump (struct netif *netif, uint8_t *packet, size_t plen) {
    struct netif_ip *iface;
    struct udp_hdr *hdr;
    char addr[IP_ADDR_STR_LEN];

    iface = (struct netif_ip *)netif;
    cprintf("   dev: %s (%s)\n", netif->dev->name, ip_addr_ntop(&iface->unicast, addr, sizeof(addr)));
    hdr = (struct udp_hdr *)packet;
    cprintf(" sport: %u\n", ntoh16(hdr->sport));
    cprintf(" dport: %u\n", ntoh16(hdr->dport));
    cprintf("   len: %u\n", ntoh16(hdr->len));
    cprintf("   sum: 0x%04x\n", ntoh16(hdr->len));
    hexdump(packet, plen);
}

static ssize_t
udp_tx (struct netif *iface, uint16_t sport, uint8_t *buf, size_t len, ip_addr_t *peer, uint16_t port) {
    char packet[65536];
    struct udp_hdr *hdr;
    ip_addr_t self;
    uint32_t pseudo = 0;

    hdr = (struct udp_hdr *)packet;
    hdr->sport = sport;
    hdr->dport = port;
    hdr->len = hton16(sizeof(struct udp_hdr) + len);
    hdr->sum = 0;
    memcpy(hdr + 1, buf, len);
    self = ((struct netif_ip *)iface)->unicast;
    pseudo += (self >> 16) & 0xffff;
    pseudo += self & 0xffff;
    pseudo += (*peer >> 16) & 0xffff;
    pseudo += *peer & 0xffff;
    pseudo += hton16((uint16_t)IP_PROTOCOL_UDP);
    pseudo += hton16(sizeof(struct udp_hdr) + len);
    hdr->sum = cksum16((uint16_t *)hdr, sizeof(struct udp_hdr) + len, pseudo);
#ifdef DEBUG
    cprintf(">>> udp_tx <<<\n");
    udp_dump((struct netif *)iface, (uint8_t *)packet, sizeof(struct udp_hdr) + len);
#endif
    return ip_tx(iface, IP_PROTOCOL_UDP, (uint8_t *)packet, sizeof(struct udp_hdr) + len, peer);
}

static void
udp_rx (uint8_t *buf, size_t len, ip_addr_t *src, ip_addr_t *dst, struct netif *iface) {
    struct udp_hdr *hdr;
    uint32_t pseudo = 0;
    struct udp_cb *cb;
    void *data;
    struct udp_queue_hdr *queue_hdr;

    if (len < sizeof(struct udp_hdr)) {
        return;
    }
    hdr = (struct udp_hdr *)buf;
    pseudo += *src >> 16;
    pseudo += *src & 0xffff;
    pseudo += *dst >> 16;
    pseudo += *dst & 0xffff;
    pseudo += hton16((uint16_t)IP_PROTOCOL_UDP);
    pseudo += hton16(len);
    if (cksum16((uint16_t *)hdr, len, pseudo) != 0) {
        cprintf("udp checksum error\n");
        return;
    }
#ifdef DEBUG
    cprintf(">>> udp_rx <<<\n");
    udp_dump((struct netif *)iface, buf, len);
#endif
    acquire(&udplock);
    for (cb = cb_table; cb < array_tailof(cb_table); cb++) {
        if (cb->used && (!cb->iface || cb->iface == iface) && cb->port == hdr->dport) {
            data = (void*)kalloc();
            if (!data) {
                release(&udplock);
                return;
            }
            queue_hdr = data;
            queue_hdr->addr = *src;
            queue_hdr->port = hdr->sport;
            queue_hdr->len = len - sizeof(struct udp_hdr);
            memcpy(queue_hdr + 1, hdr + 1, len - sizeof(struct udp_hdr));
            queue_push(&cb->queue, data, sizeof(struct udp_queue_hdr) + (len - sizeof(struct udp_hdr)));
            wakeup(cb);
            release(&udplock);
            return;
        }
    }
    release(&udplock);
    // icmp_send_destination_unreachable();
}

int
udp_api_open (void) {
    struct udp_cb *cb;

    acquire(&udplock);
    for (cb = cb_table; cb < array_tailof(cb_table); cb++) {
        if (!cb->used) {
            cb->used = 1;
            release(&udplock);
            return array_offset(cb_table, cb);
        }
    }
    release(&udplock);
    return -1;
}

int
udp_api_close (int soc) {
    struct udp_cb *cb;
    struct queue_entry *entry;

    if (soc < 0 || soc >= UDP_CB_TABLE_SIZE) {
        return -1;
    }
    acquire(&udplock);
    cb = &cb_table[soc];
    if (!cb->used) {
        release(&udplock);
        return -1;
    }
    cb->used = 0;
    cb->iface = NULL;
    cb->port = 0;
    while ((entry = queue_pop(&cb->queue)) != NULL) {
        kfree((char*)entry->data);
        kfree((char*)entry);
    }
    cb->queue.next = cb->queue.tail = NULL;
    release(&udplock);
    return 0;
}

int
udp_api_bind (int soc, struct sockaddr *addr, int addrlen) {
    struct sockaddr_in *sin;
    struct udp_cb *cb, *tmp;
    struct netif *iface = NULL;

    if (soc < 0 || soc >= UDP_CB_TABLE_SIZE) {
        return -1;
    }
    if (addr->sa_family != AF_INET) {
        return -1;
    }
    sin = (struct sockaddr_in *)addr;
    acquire(&udplock);
    cb = &cb_table[soc];
    if (!cb->used) {
        release(&udplock);
        return -1;
    }
    if (sin->sin_addr) {
        iface = ip_netif_by_addr(&sin->sin_addr);
        if (!iface) {
            release(&udplock);
            return -1;
        }
    }
    for (tmp = cb_table; tmp < array_tailof(cb_table); tmp++) {
        if (tmp->used && tmp != cb && (!iface || !tmp->iface || tmp->iface == iface) && tmp->port == sin->sin_port) {
            release(&udplock);
            return -1;
        }
    }
    cb->iface = iface;
    cb->port = sin->sin_port;
    release(&udplock);
    return 0;
}

int
udp_api_bind_iface (int soc, struct netif *iface, uint16_t port) {
    struct udp_cb *cb, *tmp;

    if (soc < 0 || soc >= UDP_CB_TABLE_SIZE) {
        return -1;
    }
    acquire(&udplock);
    cb = &cb_table[soc];
    if (!cb->used) {
        release(&udplock);
        return -1;
    }
    for (tmp = cb_table; tmp < array_tailof(cb_table); tmp++) {
        if (tmp->used && tmp != cb && (!iface || !tmp->iface || tmp->iface == iface) && tmp->port == port) {
            release(&udplock);
            return -1;
        }
    }
    cb->iface = iface;
    cb->port = port;
    release(&udplock);
    return 0;
}

ssize_t
udp_api_recvfrom (int soc, uint8_t *buf, size_t size, struct sockaddr *addr, int *addrlen) {
    struct sockaddr_in *peer = NULL;
    struct udp_cb *cb;
    struct queue_entry *entry;
    int ret = 0;
    ssize_t len;
    struct udp_queue_hdr *queue_hdr;

    if (soc < 0 || soc >= UDP_CB_TABLE_SIZE) {
        return -1;
    }
    if (addr) {
        if (*addrlen < sizeof(struct sockaddr_in)) {
            return -1;
        }
        *addrlen = sizeof(struct sockaddr_in);
        peer = (struct sockaddr_in *)addr;
    }
    acquire(&udplock);
    cb = &cb_table[soc];
    if (!cb->used) {
        release(&udplock);
        return -1;
    }
    while (!(entry = queue_pop(&cb->queue))) {
        sleep(cb, &udplock);
    }
    release(&udplock);
    queue_hdr = (struct udp_queue_hdr *)entry->data;
    if (peer) {
        peer->sin_family = AF_INET;
        peer->sin_addr = queue_hdr->addr;
        peer->sin_port = queue_hdr->port;
    }
    len = MIN(size, queue_hdr->len);
    memcpy(buf, queue_hdr + 1, len);
    kfree((char*)entry->data);
    kfree((char*)entry);
    return len;
}

ssize_t
udp_api_sendto (int soc, uint8_t *buf, size_t len, struct sockaddr *addr, int addrlen) {
    struct sockaddr_in *peer;
    struct udp_cb *cb, *tmp;
    struct netif *iface;
    uint32_t p;
    uint16_t sport;

    if (soc < 0 || soc >= UDP_CB_TABLE_SIZE) {
        return -1;
    }
    if (!addr || addr->sa_family != AF_INET || addrlen < sizeof(struct sockaddr_in)) {
        return -1;
    }
    peer = (struct sockaddr_in *)addr;
    acquire(&udplock);
    cb = &cb_table[soc];
    if (!cb->used) {
        release(&udplock);
        return -1;
    }
    iface = cb->iface;
    if (!iface) {
        iface = ip_netif_by_peer(&peer->sin_addr);
        if (!iface) {
            release(&udplock);
            return -1;
        }
    }
    if (!cb->port) {
        for (p = UDP_SOURCE_PORT_MIN; p <= UDP_SOURCE_PORT_MAX; p++) {
            for (tmp = cb_table; tmp < array_tailof(cb_table); tmp++) {
                if (tmp->port == hton16((uint16_t)p) && (!tmp->iface || tmp->iface == iface)) {
                    break;
                }
            }
            if (tmp == array_tailof(cb_table)) {
                cb->port = hton16((uint16_t)p);
                break;
            }
        }
        if (!cb->port) {
            release(&udplock);
            return -1;
        }
    }
    sport = cb->port;
    release(&udplock);
    return udp_tx(iface, sport, buf, len, &peer->sin_addr, peer->sin_port);
}

int
udp_init (void) {
    initlock(&udplock, "udp");
    ip_add_protocol(IP_PROTOCOL_UDP, udp_rx);
    return 0;
}
