#include <stdint.h>
#include <user.h>
#include <mouse.h>
#include <stdio.h>

#include "gfx.h"
#include "screen.h"
#include "sheet.h"
#include "cursor.h"
#include "taskbar.h"

int main() {
    SCREEN *ctx = open_screen();

    // backgroud
    rectangle_fill((unsigned char *)ctx->buffer, 1024, 0, 0, ctx->width-1, ctx->height-1, RGB_008484);

    // task bar
    draw_taskbar((unsigned char *)ctx->buffer, ctx->width, ctx->height);

    // mouse
    SHTCTL *shtctl = shtctl_init((unsigned char *)ctx->buffer, ctx->width, ctx->height);
    unsigned char *buf_mouse = malloc(16*16*SCREEN_B);
    SHEET *sht_mouse = sheet_alloc(shtctl);
	sheet_setbuf(sht_mouse, buf_mouse, 16, 16, RGB_008484);
    init_mouse_cursor8(buf_mouse, RGB_008484);
    sheet_slide(sht_mouse, 100, 100);
    sheet_updown(sht_mouse, 0);

    do {

    } while (1);

    close_screen();
    exit();
}