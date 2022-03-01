#include "types.h"
#include "defs.h"
#include "pty.h"
#include "param.h"
#include "spinlock.h"
#include "sleeplock.h"
#include "fs.h"
#include "file.h"
#include "stat.h"

int master_pty_open(struct inode*) {
    return -1;
}

int master_pty_read(struct inode*, char*, int) {
    return -1;
}

int master_pty_write(struct inode*, char*, int) {
    return -1;
}

int master_pty_ioctl(struct inode*, int request, void* argp) {
    return -1;
}

int master_pty_select_check(struct inode*) {
    return -1;
}

int master_pty_select_block(struct inode*, int pid, int fd) {
    return -1;
}

void slave_pty_init() {
    devsw[MASTER_PTY].open = master_pty_open;
    devsw[MASTER_PTY].read = master_pty_read;
    devsw[MASTER_PTY].write = master_pty_write;
    devsw[MASTER_PTY].ioctl = master_pty_ioctl;
    devsw[MASTER_PTY].select_check = master_pty_select_check;
    devsw[MASTER_PTY].select_block = master_pty_select_block;
}