#include "types.h"
#include "defs.h"
#include "pty.h"
#include "param.h"
#include "spinlock.h"
#include "sleeplock.h"
#include "fs.h"
#include "file.h"
#include "stat.h"

int slave_pty_open(struct inode*) {
    return -1;
}
int slave_pty_read(struct inode*, char*, int) {
    return -1;
}
int slave_pty_write(struct inode*, char*, int) {
    return -1;
}
int slave_pty_ioctl(struct inode*, int request, void* argp) {
    return -1;
}
int slave_pty_select_check(struct inode*) {
    return -1;
}
int slave_pty_select_block(struct inode*, int pid, int fd) {
    return -1;
}

void slave_pty_init() {
    devsw[SLAVE_PTY].open = slave_pty_open;
    devsw[SLAVE_PTY].read = slave_pty_read;
    devsw[SLAVE_PTY].write = slave_pty_write;
    devsw[SLAVE_PTY].ioctl = slave_pty_ioctl;
    devsw[SLAVE_PTY].select_check = slave_pty_select_check;
    devsw[SLAVE_PTY].select_block = slave_pty_select_block;
}