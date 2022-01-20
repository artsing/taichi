#include "taskbar.h"

void draw_taskbar(unsigned char *ctx, int xsize, int ysize) {
    rectangle_fill(ctx, xsize, 0, ysize - 28, xsize - 1, ysize - 28, RGB_C6C6C6);
    rectangle_fill(ctx, xsize, 0, ysize - 27, xsize - 1, ysize - 27, RGB_FFFFFF);
    rectangle_fill(ctx, xsize, 0, ysize - 26, xsize - 1, ysize - 1, RGB_C6C6C6);

    rectangle_fill(ctx, xsize, 3,  ysize - 24, 59, ysize - 24, RGB_FFFFFF);
    rectangle_fill(ctx, xsize, 2,  ysize - 24, 2,  ysize - 4,  RGB_FFFFFF);
    rectangle_fill(ctx, xsize, 3,  ysize - 4,  59, ysize - 4,  RGB_848484);
    rectangle_fill(ctx, xsize, 59, ysize - 23, 59, ysize - 5,  RGB_848484);
    rectangle_fill(ctx, xsize, 2,  ysize - 3,  59, ysize - 3,  RGB_000000);
    rectangle_fill(ctx, xsize, 60, ysize - 24, 60, ysize - 3,  RGB_000000);

    rectangle_fill(ctx, xsize, xsize - 47, ysize - 24, xsize - 4,  ysize - 24, RGB_848484);
    rectangle_fill(ctx, xsize, xsize - 47, ysize - 23, xsize - 47, ysize - 4, RGB_848484);
    rectangle_fill(ctx, xsize, xsize - 47, ysize - 3,  xsize - 4,  ysize - 3, RGB_848484);
    rectangle_fill(ctx, xsize, xsize - 47, ysize - 24, xsize - 3,  ysize - 3, RGB_848484);

    putfonts_ascii(ctx, xsize, 10,  ysize-24, RGB_000000, "pangu");

}