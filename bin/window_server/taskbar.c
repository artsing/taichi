#include "taskbar.h"

void draw_taskbar(unsigned char *ctx, int xsize, int ysize) {
    rectangle_fill(ctx, xsize, 0, 0, xsize - 1, ysize - 1, RGB_C6C6C6);
    rectangle_fill(ctx, xsize, 0, 1, xsize - 1, 1, RGB_FFFFFF);
    rectangle_fill(ctx, xsize, 0, 2, xsize - 1, ysize - 1, RGB_C6C6C6);
}