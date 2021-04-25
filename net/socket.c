// Copyright (c) 2012-2020 YAMAMOTO Masaya
// SPDX-License-Identifier: MIT

#include "types.h"
#include "defs.h"
#include "param.h"
#include "fs.h"
#include "spinlock.h"
#include "sleeplock.h"
#include "file.h"
#include "net.h"
#include "ip.h"
#include "socket.h"

struct socket {
    int type;
    int desc;
};

struct file*
socketalloc(int domain, int type, int protocol) {
    struct file *f;
    struct socket *s;

    if (domain != AF_INET || (type != SOCK_STREAM && type != SOCK_DGRAM) || protocol != 0) {
        return NULL;
    }
    f = filealloc();
    if (!f) {
        return NULL;
    }
    s = (struct socket *)kalloc();
    if (!s) {
        fileclose(f);
        return NULL;
    }
    s->type = type;
    s->desc = (type == SOCK_STREAM ? tcp_api_open() : udp_api_open());
    f->type = FD_SOCKET;
    f->readable = 1;
    f->writable = 1;
    f->socket = s;
    return f;
}

void
socketclose(struct socket *s) {
    if (s->type == SOCK_STREAM)
        tcp_api_close(s->desc);
    else
        udp_api_close(s->desc);
}

int
socketconnect(struct socket *s, struct sockaddr *addr, int addrlen) {
    if (s->type != SOCK_STREAM)
      return -1;
    return tcp_api_connect(s->desc, addr, addrlen);
}

int
socketbind(struct socket *s, struct sockaddr *addr, int addrlen) {
    if (s->type == SOCK_STREAM)
        return tcp_api_bind(s->desc, addr, addrlen);
    else
        return udp_api_bind(s->desc, addr, addrlen);
}

int
socketlisten(struct socket *s, int backlog) {
    if (s->type != SOCK_STREAM)
        return -1;
    return tcp_api_listen(s->desc, backlog);
}

struct file *
socketaccept(struct socket *s, struct sockaddr *addr, int *addrlen) {
    int adesc;
    struct file *f;
    struct socket *as;
    if (s->type != SOCK_STREAM)
        return NULL;
    f = filealloc();
    if (!f) {
        return NULL;
    }
    as = (struct socket *)kalloc();
    if (!as) {
        fileclose(f);
        return NULL;
    }
    adesc = tcp_api_accept(s->desc, addr, addrlen);
    if (adesc == -1) {
        fileclose(f);
        kfree((void*)as);
        return NULL;
    }
    as->type = s->type;
    as->desc = adesc;
    f->type = FD_SOCKET;
    f->readable = 1;
    f->writable = 1;
    f->socket = as;
    return f;
}

int
socketread(struct socket *s, char *addr, int n) {
    if (s->type != SOCK_STREAM)
        return -1;
    return tcp_api_recv(s->desc, (uint8_t *)addr, n);
}

int
socketwrite(struct socket *s, char *addr, int n) {
    if (s->type != SOCK_STREAM)
        return -1;
    return tcp_api_send(s->desc, (uint8_t *)addr, n);
}

int
socketrecvfrom(struct socket *s, char *buf, int n, struct sockaddr *addr, int *addrlen) {
    if (s->type != SOCK_DGRAM)
        return -1;
    return udp_api_recvfrom(s->desc, (uint8_t *)buf, n, addr, addrlen);
}

int
socketsendto(struct socket *s, char *buf, int n, struct sockaddr *addr, int addrlen) {
    if (s->type != SOCK_DGRAM)
        return -1;
    return udp_api_sendto(s->desc, (uint8_t *)buf, n, addr, addrlen);
}

int
socketioctl(struct socket *s, int req, void *arg) {
    struct ifreq *ifreq;
    struct netdev *dev;
    struct netif *iface;

    switch (req) {
    case SIOCGIFINDEX:
        ifreq = (struct ifreq *)arg;
        dev = netdev_by_name(ifreq->ifr_name);
        if (!dev)
            return -1;
        ifreq->ifr_ifindex = dev->index;
        break;
    case SIOCGIFNAME:
        ifreq = (struct ifreq *)arg;
        dev = netdev_by_index(ifreq->ifr_ifindex);
        if (!dev)
            return -1;
        strncpy(ifreq->ifr_name, dev->name, sizeof(ifreq->ifr_name));
        break;
    case SIOCSIFNAME:
        /* TODO */
        break;
    case SIOCGIFHWADDR:
        ifreq = (struct ifreq *)arg;
        dev = netdev_by_name(ifreq->ifr_name);
        if (!dev)
            return -1;
        /* TODO: HW type check */
        memcpy(ifreq->ifr_hwaddr.sa_data, dev->addr, dev->alen);
        break;
    case SIOCSIFHWADDR:
        /* TODO */
        break;
    case SIOCGIFFLAGS:
        ifreq = (struct ifreq *)arg;
        dev = netdev_by_name(ifreq->ifr_name);
        if (!dev)
            return -1;
        ifreq->ifr_flags = dev->flags;
        break;
    case SIOCSIFFLAGS:
        ifreq = (struct ifreq *)arg;
        dev = netdev_by_name(ifreq->ifr_name);
        if (!dev)
            return -1;
        if ((dev->flags & IFF_UP) != (ifreq->ifr_flags & IFF_UP)) {
            if (ifreq->ifr_flags & IFF_UP)
                dev->ops->open(dev);
            else
                dev->ops->stop(dev);
        }
        break;
    case SIOCGIFADDR:
        ifreq = (struct ifreq *)arg;
        dev = netdev_by_name(ifreq->ifr_name);
        if (!dev)
            return -1;
        iface = netdev_get_netif(dev, ifreq->ifr_addr.sa_family);
        if (!iface)
            return -1;
        ((struct sockaddr_in *)&ifreq->ifr_addr)->sin_addr = ((struct netif_ip *)iface)->unicast;
        break;
    case SIOCSIFADDR:
        ifreq = (struct ifreq *)arg;
        dev = netdev_by_name(ifreq->ifr_name);
        if (!dev)
            return -1;
        iface = netdev_get_netif(dev, ifreq->ifr_addr.sa_family);
        if (iface) {
            if (ip_netif_reconfigure(iface, ((struct sockaddr_in *)&ifreq->ifr_addr)->sin_addr, ((struct netif_ip *)iface)->netmask, ((struct netif_ip *)iface)->gateway) == -1)
                return -1;
        } else {
            iface = ip_netif_alloc(((struct sockaddr_in *)&ifreq->ifr_addr)->sin_addr, 0xffffffff, 0);
            if (!iface)
                return -1;
            netdev_add_netif(dev, iface);
        }
        break;
    case SIOCGIFNETMASK:
        ifreq = (struct ifreq *)arg;
        dev = netdev_by_name(ifreq->ifr_name);
        if (!dev)
            return -1;
        iface = netdev_get_netif(dev, ifreq->ifr_addr.sa_family);
        if (!iface)
            return -1;
        ((struct sockaddr_in *)&ifreq->ifr_netmask)->sin_addr = ((struct netif_ip *)iface)->netmask;
        break;
    case SIOCSIFNETMASK:
        ifreq = (struct ifreq *)arg;
        dev = netdev_by_name(ifreq->ifr_name);
        if (!dev)
            return -1;
        iface = netdev_get_netif(dev, ifreq->ifr_addr.sa_family);
        if (!iface)
            return -1;
        if (ip_netif_reconfigure(iface, ((struct netif_ip *)iface)->unicast, ((struct sockaddr_in *)&ifreq->ifr_addr)->sin_addr, ((struct netif_ip *)iface)->gateway) == -1)
            return -1;
        break;
    case SIOCGIFBRDADDR:
        ifreq = (struct ifreq *)arg;
        dev = netdev_by_name(ifreq->ifr_name);
        if (!dev)
            return -1;
        iface = netdev_get_netif(dev, ifreq->ifr_addr.sa_family);
        if (!iface)
            return -1;
        ((struct sockaddr_in *)&ifreq->ifr_broadaddr)->sin_addr = ((struct netif_ip *)iface)->broadcast;
        break;
    case SIOCSIFBRDADDR:
        /* TODO */
        break;
    case SIOCGIFMTU:
        ifreq = (struct ifreq *)arg;
        dev = netdev_by_name(ifreq->ifr_name);
        if (!dev)
            return -1;
        ifreq->ifr_mtu = dev->mtu;
        break;
    case SIOCSIFMTU:
        break;
    default:
        return -1;
    }
    return 0;
}
