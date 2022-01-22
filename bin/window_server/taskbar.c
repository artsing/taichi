#include "taskbar.h"

void draw_taskbar(unsigned char *ctx, int xsize, int ysize) {
    rectangle_fill(ctx, xsize, 0, 0, xsize - 1, ysize - 1, RGB_C6C6C6);
    rectangle_fill(ctx, xsize, 0, 1, xsize - 1, 1, RGB_FFFFFF);
    rectangle_fill(ctx, xsize, 0, 2, xsize - 1, ysize - 1, RGB_C6C6C6);
}

void add_taskbar_btn(SHEET *sheet, char *title) {
    int margin = 4, width = 68;
    int x0 = margin, x1 = x0 + width;
    int y0 = margin, y1 = sheet->bysize - margin;

    rectangle_fill(sheet->buf, sheet->bxsize, x0, y0, x1, y1, RGB_C6C6C6);

    rectangle_fill(sheet->buf, sheet->bxsize, x0-1, y0-1, x0-1, y1-1, RGB_FFFFFF);
    rectangle_fill(sheet->buf, sheet->bxsize, x0-1, y0-1, x1-1, y0-1, RGB_FFFFFF);

    rectangle_fill(sheet->buf, sheet->bxsize, x0, y1+1, x1+1, y1+1, RGB_000000);
    rectangle_fill(sheet->buf, sheet->bxsize, x1+1, y0, x1+1, y1, RGB_000000);
    putfonts_ascii(sheet->buf, sheet->bxsize, x0+margin/2, y0+margin/2, rgb(0, 0, 0), title);
}