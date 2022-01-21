#include "window.h"

void draw_window(unsigned char *ctx, int xsize, int ysize, char *title) {
    static char closebtn[14][16] = {
        "OOOOOOOOOOOOOOO@",
        "OQQQQQQQQQQQQQ$@",
        "OQQQQQQQQQQQQQ$@",
        "OQQQ@@QQQQ@@QQ$@",
        "OQQQQ@@QQ@@QQQ$@",
        "OQQQQQ@@@@QQQQ$@",
        "OQQQQQQ@@QQQQQ$@",
        "OQQQQQ@@@@QQQQ$@",
        "OQQQQ@@QQ@@QQQ$@",
        "OQQQ@@QQQQ@@QQ$@",
        "OQQQQQQQQQQQQQ$@",
        "OQQQQQQQQQQQQQ$@",
        "O$$$$$$$$$$$$$$@",
        "@@@@@@@@@@@@@@@@"
    };

    rectangle_fill(ctx, xsize, 0,         0,         xsize - 1, 0,         RGB_C6C6C6);
    rectangle_fill(ctx, xsize, 1,         1,         xsize - 2, 1,         RGB_FFFFFF);
    rectangle_fill(ctx, xsize, 0,         0,         0,         ysize - 1, RGB_C6C6C6);
    rectangle_fill(ctx, xsize, 1,         1,         1,         ysize - 2, RGB_FFFFFF);
    rectangle_fill(ctx, xsize, xsize - 2, 1,         xsize - 2, ysize - 2, RGB_848484);
    rectangle_fill(ctx, xsize, xsize - 1, 0,         xsize - 1, ysize - 1, RGB_000000);
    rectangle_fill(ctx, xsize, 2,         2,         xsize - 3, ysize - 3, RGB_C6C6C6);
    rectangle_fill(ctx, xsize, 3,         3,         xsize - 4, 20,        RGB_000084);
    rectangle_fill(ctx, xsize, 1,         ysize - 2, xsize - 2, ysize - 2, RGB_848484);
    rectangle_fill(ctx, xsize, 0,         ysize - 1, xsize - 1, ysize - 1, RGB_000000);

    putfonts_ascii(ctx, xsize, 6, 2, RGB_FFFFFF, title);

    char c;
    uint32_t color;
    for (int y1 = 0; y1 < 14; y1++) {
        for (int x1 = 0; x1 < 16; x1++) {
            c = closebtn[y1][x1];
            if (c == '@') {
                color = RGB_000000;
            } else if (c == '$') {
                color = RGB_848484;
            } else if (c == 'Q') {
                color = RGB_C6C6C6;
            } else {
                color = RGB_FFFFFF;
            }
            SCREEN_POINT(ctx, xsize, xsize-21+x1, y1+5) = color;
        }
    }
}