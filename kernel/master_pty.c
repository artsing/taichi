#include "types.h"
#include "defs.h"
#include "param.h"
#include "spinlock.h"
#include "sleeplock.h"
#include "fs.h"
#include "file.h"
#include "stat.h"

#include "blocker.h"
#include "ring_buffer.h"
#include "pty.h"

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

            ring_buffer_init(&m->in, "PTY_RB_IN");
            ring_buffer_init(&m->out, "PTY_RB_OUT");
            select_blocker_init(&m->blocker, "PTY_BLOCKER");

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

master_pty* lookup_master_pty(int index) {
    master_pty *m = NULL;
    if (index > 0 && index <= PTY_SIZE) {
        acquire(&pty_table.lock);

        m = &(pty_table.master[index-1]);
        if (m->index != index) {
            m = NULL;
        }

        release(&pty_table.lock);
    }
    return m;
}

int master_pty_open(struct inode* ip) {
    return -1;
}

int master_pty_read(struct inode* ip, char* buf, int n) {
    master_pty* m = lookup_master_pty(ip->minor);
    if (m == NULL) {
        return -1;
    }
    //cprintf("[PTY][master_pty_read] ip->major = %d\n", ip->major);
    return ring_buffer_read(&m->in, buf, n);
}

int master_pty_write(struct inode* ip, char* buf, int n) {
    master_pty* m = lookup_master_pty(ip->minor);
    if (m == NULL) {
        return -1;
    }
    //cprintf("[PTY][master_pty_write] ip->major = %d\n", ip->major);
    return ring_buffer_write(&m->out, buf, n);
}

int master_pty_ioctl(struct inode* ip, int request, void* argp) {
    return -1;
}

int master_pty_select_check(struct inode* ip) {
    master_pty* m = lookup_master_pty(ip->minor);
    if (m == NULL) {
        return -1;
    }

    if (ring_buffer_empty(&m->in)) {
        return 0;
    } else {
        return 1;
    }
}

int master_pty_select_block(struct inode* ip, int pid, int fd) {
    master_pty* m = lookup_master_pty(ip->minor);
    if (m == NULL) {
        return -1;
    }

    return select_blocker_block(&m->blocker, pid, fd);
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