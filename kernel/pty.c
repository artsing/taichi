#include "pty.h"

int pty_open(struct inode *ip)
{
    return 0;
}

int pty_read(struct inode *ip, char *dst, int n)
{
    return -1;
}

int pty_write(struct inode *ip, char *buf, int n)
{
    return -1;
}

int pty_ioctl(struct inode *ip, int req, void* arg)
{
    return -1;
}

int pty_slelect_check(struct inode* ip)
{
    return -1;
}

int pty_slelect_block(struct inode* ip)
{
    return -1;
}

void pty_init(void)
{
    devsw[PTY].open = pty_open;
    devsw[PTY].write = pty_write;
    devsw[PTY].read = pty_read;
    devsw[PTY].ioctl = pty_ioctl;
    devsw[PTY].select_check = pty_slelect_check;
    devsw[PTY].select_block = pty_slelect_block;
}
