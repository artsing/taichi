#include "types.h"
#include "defs.h"
#include "param.h"
#include "traps.h"
#include "spinlock.h"
#include "sleeplock.h"
#include "fs.h"
#include "file.h"
#include "x86.h"

#include "blocker.h"

void select_blocker_init(select_blocker *sb, char *lock) {
    assert(sb != NULL && lock != NULL);

    initlock(&sb->lock, lock);
    sb->locking = 1;
    sb->pid = -1;
    sb->fd = -1;
}

int select_blocker_block(select_blocker *sb, int pid, int fd) {
    if (sb->locking) {
        acquire(&sb->lock);
    }

    if (sb->pid == -1 && sb->fd == -1) {
        sb->pid = pid;
        sb->fd = fd;
        return 1;
    }

    if (sb->locking) {
        release(&sb->lock);
    }
    return 0;
}

int select_blocker_unblock(select_blocker *sb) {
    if (sb->locking) {
        acquire(&sb->lock);
    }

    if (sb->pid != -1 && sb->fd != -1) {
        unblock(sb->pid, sb->fd);
        sb->pid = -1;
        sb->fd = -1;
        return 1;
    }

    if (sb->locking) {
        release(&sb->lock);
    }
    return 0;
}