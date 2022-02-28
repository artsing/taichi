#ifndef _PTY_H_
#define _PTY_H_

typedef struct master_pty_s master_pty;
typedef struct slave_pty_s slave_pty;

struct master_pty_s {
    int index;
    char ptsname[20];
    slave_pty *pts;
};

struct slave_pty_s {
    master_pty *ptm;
};


#endif // _PTY_H_