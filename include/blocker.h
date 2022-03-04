#ifndef _K_BLOCKER_H_
#define _K_BLOCKER_H_

typedef struct select_blocker_s {
    struct spinlock lock;
    int locking;

    int pid;
    int fd;
} select_blocker;

void select_blocker_init(select_blocker *sb, char *lock);
int select_blocker_block(select_blocker *sb, int pid, int fd);
int select_blocker_unblock(select_blocker *sb);

#endif // _K_BLOCKER_H_