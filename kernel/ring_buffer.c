#include "types.h"
#include "x86.h"
#include "defs.h"
#include "param.h"
#include "spinlock.h"
#include "sleeplock.h"

#include "ring_buffer.h"

static int ring_buffer_write1(ring_buffer *rb, char c) {
    if (((rb->pos + 1) % RING_BUF_SIZE) != rb->read_pos) {
        rb->data[rb->pos] = c;
        rb->pos = (rb->pos + 1) % RING_BUF_SIZE;

    //cprintf("----------write1 pos:%d, char:%c ret=1\n", rb->pos, c);
        return 1;
    }
    //cprintf("write1 ret = %d\n", 1);
    return 0;
}

void ring_buffer_init(ring_buffer *rb, char *lock) {
    assert(rb != NULL && lock != NULL);

    initlock(&rb->lock, lock);
    rb->locking = 1;
    rb->pos = 0;
    rb->read_pos = 0;
}

int ring_buffer_write_byte(ring_buffer *rb, char c) {
    if (rb->locking) {
        acquire(&rb->lock);
    }

    int ret = ring_buffer_write1(rb, c);

    if (rb->locking) {
        release(&rb->lock);
    }
    return ret;
}

int ring_buffer_write(ring_buffer *rb, char *data, int n) {
    int ret = 0;
    if (rb->locking) {
        acquire(&rb->lock);
    }

    for (int i = 0; i < n; i++) {
        if (ring_buffer_write1(rb, data[i]) == 0) {
            ret = i;
            goto out;
        }
    }
    ret = n;

out:
    if (rb->locking) {
        release(&rb->lock);
    }
    //cprintf("<< << <<[ wirte=%d; pos=%d, read_pos=%d %s]\n", ret, rb->pos, rb->read_pos, rb->lock.name);
    return ret;
}

int ring_buffer_read(ring_buffer *rb, char *dst, int n) {
    int result = n;
    if (rb->locking) {
        acquire(&rb->lock);
    }

    if (rb->read_pos == rb->pos) {
        result = 0;
        goto ret;
    }

    for (int i=0; i<n; i++) {
        // buffer is empty
        if (rb->read_pos == rb->pos) {
            result = i;
            goto ret;
        }

        *(dst++) = rb->data[rb->read_pos];
        rb->data[rb->read_pos] = 0;
        rb->read_pos = (rb->read_pos + 1) % RING_BUF_SIZE;
    }

ret:
    if (rb->locking) {
        release(&rb->lock);
    }
    //cprintf(">> >> >> [ read=%d; pos=%d, read_pos=%d %s]\n", result, rb->pos, rb->read_pos, rb->lock.name);
    return result;
}

int ring_buffer_empty(ring_buffer *rb) {
    int result;
    if (rb->locking) {
        acquire(&rb->lock);
    }

    if (rb->read_pos == rb->pos) {
        result = 1;
    } else {
        result = 0;
    }

    if (rb->locking) {
        release(&rb->lock);
    }
    return result;
}

