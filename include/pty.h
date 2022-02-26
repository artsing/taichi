#ifndef _PTY_H_
#define _PTY_H_

typedef struct pty_s {
    unsigned char bitmap;
} ptmx;

typedef struct master_pty_s {
    int index;
    char ptsname[20];
    slave_pty *pts;
} master_pty;

typedef struct slave_pty_s {
    master_pty *ptm;
} slave_pty;


#endif // _PTY_H_