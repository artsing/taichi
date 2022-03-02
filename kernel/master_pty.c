#include "types.h"
#include "defs.h"
#include "pty.h"
#include "param.h"
#include "spinlock.h"
#include "sleeplock.h"
#include "fs.h"
#include "file.h"
#include "stat.h"

struct {
    struct spinlock lock;
    master_pty master[PTY_SIZE];
    slave_pty slave[PTY_SIZE];
} pty_table;

master_pty* alloc_master_pty() {
    master_pty* m;
    acquire(&pty_table.lock);

    for (int i = 0; i < PTY_SIZE; i++) {
        m = &(pty_table.master[i]);
        if (m->index == 0) {
            m->index = i + 1;
            m->slave = &(pty_table.slave[i]);
            m->slave->master = m;
            release(&pty_table.lock);
            return m;
        }
    }

    release(&pty_table.lock);
    return NULL;
}

void free_master_pty(master_pty *m_pty) {
    master_pty* m;

    if (m_pty != NULL) {
        acquire(&pty_table.lock);
        for (int i = 0; i < PTY_SIZE; i++) {
            m = &(pty_table.master[i]);
            if (m == m_pty) {
                m->index = 0;
                break;
            }
        }
        release(&pty_table.lock);
    }
}

int master_pty_open(struct inode* ip) {
    return -1;
}

int master_pty_read(struct inode* ip, char* buf, int n) {
    cprintf("master pty read index = %d", ip->minor);
    return -1;
}

int master_pty_write(struct inode* ip, char* buf, int n) {
    return -1;
}

int master_pty_ioctl(struct inode* ip, int request, void* argp) {
    return -1;
}

int master_pty_select_check(struct inode* ip) {
    return -1;
}

int master_pty_select_block(struct inode* ip, int pid, int fd) {
    return -1;
}

int master_pty_ptsname(struct inode* ip, char* buf, int n) {
    return -1;
}


void master_pty_init() {
    initlock(&pty_table.lock, "pty_table");

    devsw[MASTER_PTY].open = master_pty_open;
    devsw[MASTER_PTY].read = master_pty_read;
    devsw[MASTER_PTY].write = master_pty_write;
    devsw[MASTER_PTY].ioctl = master_pty_ioctl;
    devsw[MASTER_PTY].select_check = master_pty_select_check;
    devsw[MASTER_PTY].select_block = master_pty_select_block;
    devsw[MASTER_PTY].ptsname = master_pty_ptsname;
}