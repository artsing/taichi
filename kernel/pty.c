#include "pty.h"
#include "param.h"

// free index
static unsigned int index_bitmap = 0;

int alloc_index()
{
    for (int i = 0; i < PTY_SIZE; i++) {
        if (!(index_bitmap & (1 << i))) {
            index_bitmap &= (1 << i);
            return i;
        }
    }
    return -1;
}

int free_index(int index)
{
    if (index >= 0 && index < PTY_SIZE) {
        index_bitmap &= ~(1 << i);
        return 1;
    }
    return 0;
}

int pty_open(struct inode *ip)
{
    int index = alloc_index();
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
