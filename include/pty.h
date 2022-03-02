#ifndef _PTY_H_
#define _PTY_H_

typedef struct master_pty_s master_pty;
typedef struct slave_pty_s slave_pty;

struct master_pty_s {
    int index;
    slave_pty *slave;

    ring_buffer in;
    ring_buffer out;
};

struct slave_pty_s {
    master_pty *master;
};

void master_pty_init();
void slave_pty_init();

master_pty* alloc_master_pty();
void free_master_pty(master_pty*);

master_pty* lookup_master_pty(int index);

#endif // _PTY_H_