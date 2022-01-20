#include "window.h"

void draw_window(unsigned char *ctx, int x, int y, int xsize, int ysize, char *title) {
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

    rectangle_fill(ctx, xsize, x,             y,             x + xsize - 1, y,             RGB_C6C6C6);
    rectangle_fill(ctx, xsize, x + 1,         y + 1,         x + xsize - 2, y + 1,         RGB_FFFFFF);
    rectangle_fill(ctx, xsize, x,             y,             x,             y + ysize - 1, RGB_C6C6C6);
    rectangle_fill(ctx, xsize, x + 1,         y + 1,         x + 1,         y + ysize - 2, RGB_FFFFFF);
    rectangle_fill(ctx, xsize, x + xsize - 2, y + 1,         x + xsize - 2, y + ysize - 2, RGB_848484);
    rectangle_fill(ctx, xsize, x + xsize - 1, y,             x + xsize - 1, y + ysize - 1, RGB_000000);
    rectangle_fill(ctx, xsize, x + 2,         y + 2,         x + xsize - 3, y + ysize - 3, RGB_C6C6C6);
    rectangle_fill(ctx, xsize, x + 3,         y + 3,         x + xsize - 4, y + 20,        RGB_000084);
    rectangle_fill(ctx, xsize, x + 1,         y + ysize - 2, x + xsize - 2, y + ysize - 2, RGB_848484);
    rectangle_fill(ctx, xsize, x,             y + ysize - 1, x + xsize - 1, y + ysize - 1, RGB_000000);

    putfonts_ascii(ctx, xsize, x + 6, y+2, RGB_FFFFFF, title);

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
            SCREEN_POINT(ctx, xsize, x+xsize-21+x1, y+y1+5) = color;
        }
    }
}