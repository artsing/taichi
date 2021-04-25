// Copyright (c) 2012-2020 YAMAMOTO Masaya
// SPDX-License-Identifier: MIT

#include "types.h"
#include "defs.h"
#include "net.h"
#include "ip.h"

int
sys_ifget(void)
{
    for (struct netdev *dev = netdev_root(); dev; dev = dev->next) {
        struct netif *iface = dev->ifs;
        if (!iface) {
            cprintf("%s: no address [%s]\n", dev->name, dev->flags & NETDEV_FLAG_UP ? "UP" : "DOWN");
        } else {
            char unicast[IP_ADDR_STR_LEN];
            char netmask[IP_ADDR_STR_LEN];            
            cprintf("%s: %s/%s [%s]\n",
                dev->name,
                ip_addr_ntop(&((struct netif_ip *)iface)->unicast, unicast, sizeof(unicast)),
                ip_addr_ntop(&((struct netif_ip *)iface)->netmask, netmask, sizeof(netmask)),
                dev->flags & NETDEV_FLAG_UP ? "UP" : "DOWN");
        }
    }
    return 0;
}

int
sys_ifset(void)
{
    char *name, *addr, *mask;
    if (argstr(0, &name) < 0 || argstr(1, &addr) < 0 || argstr(2, &mask) < 0)
        return -1;
    for (struct netdev *dev = netdev_root(); dev; dev = dev->next) {
        if (strncmp(dev->name, name, sizeof(dev->name)-1) == 0) {
            ip_netif_register(dev, addr, mask, NULL);
            return 0;
        }
    }
    return 0;
}

int
sys_ifup(void)
{
    char *name;
    if (argstr(0, &name) < 0)
        return -1;
    for (struct netdev *dev = netdev_root(); dev; dev = dev->next) {
        if (strncmp(dev->name, name, sizeof(dev->name)-1) == 0) {
            dev->ops->open(dev);
            return 0;
        }
    }
    return -1;
}

int
sys_ifdown(void)
{
    char *name;
    if (argstr(0, &name) < 0)
        return -1;
    for (struct netdev *dev = netdev_root(); dev; dev = dev->next) {
        if (strncmp(dev->name, name, sizeof(dev->name)-1) == 0) {
            dev->ops->stop(dev);
            return 0;
        }
    }
    return -1;
}
