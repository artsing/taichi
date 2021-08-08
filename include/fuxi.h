#ifndef _FUXI_H_
#define _FUXI_H_
#include <stdint.h>

typedef struct fx_window_s {
    // window id
    uint32_t id;

    // position x and y
    int32_t x;
    int32_t y;

    // window's width and height
    uint32_t width;
    uint32_t height;

    // buffer
    char *buffer;
} fx_window_t;

#endif /*_FUXI_H_*/