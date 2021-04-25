#define NETDEV_TYPE_ETHERNET  (0x0001)
#define NETDEV_TYPE_SLIP      (0x0002)

#include "if.h"

#define NETDEV_FLAG_BROADCAST IFF_BROADCAST
#define NETDEV_FLAG_MULTICAST IFF_MULTICAST
#define NETDEV_FLAG_P2P       IFF_POINTOPOINT
#define NETDEV_FLAG_LOOPBACK  IFF_LOOPBACK
#define NETDEV_FLAG_NOARP     IFF_NOARP
#define NETDEV_FLAG_PROMISC   IFF_PROMISC
#define NETDEV_FLAG_RUNNING   IFF_RUNNING
#define NETDEV_FLAG_UP        IFF_UP

#define NETPROTO_TYPE_IP      (0x0800)
#define NETPROTO_TYPE_ARP     (0x0806)
#define NETPROTO_TYPE_IPV6    (0x86dd)

#define NETIF_FAMILY_IPV4     (0x02)
#define NETIF_FAMILY_IPV6     (0x0a)

#ifndef IFNAMSIZ
#define IFNAMSIZ 16
#endif

struct netdev;

struct netif {
    struct netif *next;
    uint8_t family;
    struct netdev *dev;
    /* Depends on implementation of protocols. */
};

struct netdev_ops {
    int (*open)(struct netdev *dev);
    int (*stop)(struct netdev *dev);
    int (*xmit)(struct netdev *dev, uint16_t type, const uint8_t *packet, size_t size, const void *dst);
};

struct netdev {
    struct netdev *next;
    struct netif *ifs;
    int index;
    char name[IFNAMSIZ];
    uint16_t type;
    uint16_t mtu;
    uint16_t flags;
    uint16_t hlen;
    uint16_t alen;
    uint8_t addr[16];
    uint8_t peer[16];
    uint8_t broadcast[16];
    struct netdev_ops *ops;
    void *priv;
};
