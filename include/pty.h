#ifndef _PTY_H_
#define _PTY_H_


typedef struct master_pty_s {
    int index;
    char ptsname[20];
    struct slave_pty_s *pts;
} master_pty;

typedef struct slave_pty_s {
    master_pty *ptm;
} slave_pty;


#endif // _PTY_H_