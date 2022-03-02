#ifndef _RING_BUFFER_H_
#define _RING_BUFFER_H_

typedef struct ring_buffer_s ring_buffer;

struct ring_buffer_s {
    struct spinlock lock;
    int locking;

    char data[RING_BUF_SIZE];
    int pos;
    int read_pos;
};

void ring_buffer_init(ring_buffer *rb, char* lock);
int ring_buffer_write_byte(ring_buffer *rb, char c);
int ring_buffer_write(ring_buffer *rb, char *data, int n);
int read_ring_buffer(ring_buffer *rb, char *dst, int n);

#endif //_RING_BUFFER_H_