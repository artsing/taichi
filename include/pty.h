#ifndef _PTY_H_
#define _PTY_H_

typedef struct pty_s {
    struct pipe *p0;
    struct pipe *p1;
} pty_t;

int ptyalloc(struct file **f0, struct file **f1) {
    struct pty_t *p;
    p = 0;
    *f0 = *f1 = 0;

    if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
        goto bad;
    if((p = (struct pty_t*)kalloc()) == 0)
        goto bad;

    p->p0 = filealloc()

    //(*f0)->type = FD_PIPE;
    (*f0)->readable = 1;
    (*f0)->writable = 0;
    //(*f1)->type = FD_PIPE;
    (*f1)->readable = 0;
    (*f1)->writable = 1;

bad:
    if(p)
        kfree((char*)p);
    if(*f0)
        fileclose(*f0);
    if(*f1)
        fileclose(*f1);
    return -1;
}


#endif // _PTY_H_