#include "types.h"
#include "defs.h"
#include "param.h"
#include "spinlock.h"
#include "sleeplock.h"
#include "fs.h"
#include "file.h"
#include "stat.h"

#include "ring_buffer.h"
#include "pty.h"

int pty_open(struct inode *ip)
{
    struct inode *inodeptr;
    char buf[32];

    master_pty* m = alloc_master_pty();
    if (m == NULL) {
        cprintf("alloc master pty failed.\n");
        return -1;
    }

    int index = m->index;
    snprintf(buf, sizeof(buf), "/dev/pts/%d", index);
    ip->major = MASTER_PTY;
    ip->minor = index;

    begin_op();
    if((inodeptr = create(buf, T_DEV, SLAVE_PTY, index)) != 0){
        iunlockput(inodeptr);
    }

    end_op();
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

int pty_slelect_block(struct inode* ip, int pid, int fd)
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

    master_pty_init();
    slave_pty_init();
}
