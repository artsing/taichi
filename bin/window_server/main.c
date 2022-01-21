#include <stdint.h>
#include <user.h>
#include <mouse.h>
#include <stdio.h>

#include "gfx.h"
#include "screen.h"
#include "sheet.h"
#include "cursor.h"
#include "taskbar.h"
#include "window.h"

int main() {
    // open screen
    SCREEN *screen = open_screen();

    // sheet controller
    SHTCTL *shtctl = shtctl_init(screen->buffer, screen->width, screen->height);

    // backgroud
    SHEET *sht_back  = sheet_alloc(shtctl);
    unsigned char *buf_back  = malloc(screen->width * screen->height * SCREEN_B);
    sheet_setbuf(sht_back, buf_back, screen->width, screen->height, -1); /* 无透明色 */
    rectangle_fill(buf_back, screen->width, 0, 0, screen->width-1, screen->height-1, RGB_008484);

    // task bar
    //draw_taskbar((unsigned char *)screen->buffer, screen->width, screen->height);

    // mouse
    unsigned char *buf_mouse = malloc(16*16*SCREEN_B);
    SHEET *sht_mouse = sheet_alloc(shtctl);
    sheet_setbuf(sht_mouse, buf_mouse, 16, 16, 99);
    init_mouse_cursor8(buf_mouse, 99);

    // window
    int win_w = 400, win_h = 300;
    SHEET *sht_win = sheet_alloc(shtctl);
    unsigned char *buf_win = malloc(win_w * win_h * SCREEN_B);
    sheet_setbuf(sht_win, buf_win, win_w, win_h, -1);
    draw_window(buf_win, win_w, win_h, "Terminal");

    sheet_slide(sht_back, 0, 0);

    int win_x = 100, win_y = 100;
    sheet_slide(sht_win, win_x, win_y);

    int cursor_x = screen->width / 2;
    int cursor_y = screen->height / 2;
    sheet_slide(sht_mouse, cursor_x, cursor_y);

    sheet_updown(sht_back, 0);
    sheet_updown(sht_win, 1);
    sheet_updown(sht_mouse, 3);

    FILE *mouse = fopen("/dev/mouse", "w");
    if (mouse == NULL) {
        printf(1, "open /dev/mouse failed\n");
    } else {
        printf(1, "open /dev/mouse succes.\n");
    }

    mouse_packet_t *packets = malloc(sizeof(mouse_packet_t) * 1024);
    bool move_win = false;
    do {
        size_t n = fread(packets, sizeof(mouse_packet_t), 1024, mouse);
        if (n >0) {
            for (int i=0; i<n; i++) {
                mouse_packet_t packet = packets[i];
                if (packet.magic == MOUSE_MAGIC) {
                    // update cursor position x
                    cursor_x = cursor_x + packet.x;
                    if (cursor_x < 0)
                        cursor_x = 0;
                    if (cursor_x > screen->width - 1)
                        cursor_x = screen->width - 1;

                    // update cursor position y
                    cursor_y = cursor_y - packet.y;
                    if (cursor_y < 0)
                        cursor_y = 0;
                    if (cursor_y > screen->height - 1)
                        cursor_y = screen->height - 1;

                    // move cursor
                    sheet_slide(sht_mouse, cursor_x, cursor_y);

                    if (packet.buttons == LEFT_CLICK) {
                        int x0 = cursor_x - win_x;
                        int y0 = cursor_y - win_y;

                        if ((x0 > 3 && x0 < win_w - 25 && y0 > 1 && y0 < 20)
                            || move_win) {
                            move_win = true;
                            sheet_slide(sht_win, win_x += packet.x, win_y -= packet.y);
                        } else if (x0 > win_w - 25 && x0 < win_w -3 && y0 > 3 && y0 < 16) {
                            sheet_updown(sht_win, -1);
                        }
                    } else {
                        move_win = false;
                    }
                }
            }
        }
    } while (1);

    close_screen();
    exit();
}
