#include <stdint.h>
#include <time.h>
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
    sheet_slide(sht_back, 0, 0);

    // task bar
    SHEET *sht_task = sheet_alloc(shtctl);
    int task_w = screen->width;
    int task_h = 28;
    int task_x = 0, task_y = screen->height-task_h;
    unsigned char *buf_task = malloc(task_w * task_h * SCREEN_B);
    sheet_setbuf(sht_task, buf_task, task_w, task_h, -1);
    draw_taskbar(buf_task, task_w, task_h);
    sheet_slide(sht_task, task_x, task_y);
    add_taskbar_btn(sht_task, "Terminal");

    // mouse
    unsigned char *buf_mouse = malloc(16 * 16 * SCREEN_B);
    SHEET *sht_mouse = sheet_alloc(shtctl);
    sheet_setbuf(sht_mouse, buf_mouse, 16, 16, 99);
    init_mouse_cursor8(buf_mouse, 99);
    int cursor_x = screen->width / 2;
    int cursor_y = screen->height / 2;
    sheet_slide(sht_mouse, cursor_x, cursor_y);

    // window
    int win_w = 400, win_h = 300;
    SHEET *sht_win = sheet_alloc(shtctl);
    unsigned char *buf_win = malloc(win_w * win_h * SCREEN_B);
    sheet_setbuf(sht_win, buf_win, win_w, win_h, -1);
    draw_window(buf_win, win_w, win_h, "Terminal");
    make_textbox(sht_win, 5, 25, win_w-10, win_h-30, RGB_000000);
    int win_x = 100, win_y = 100;
    sheet_slide(sht_win, win_x, win_y);
    static int x = 5;
    static int y = 24;
    putchar_ascii(buf_win, win_w, x, y, RGB_FFFFFF, '>');
    x += 8;

    sheet_updown(sht_back, 0);
    sheet_updown(sht_win, 1);
    sheet_updown(sht_task, 2);
    sheet_updown(sht_mouse, 3);

    int masterfd, slavefd;
    int ret = openpty(&masterfd, &slavefd);
    char *ls = "ls\n";

    if (ret >= 0) {
        printf(1, "fdm = %d, fds = %d\n", masterfd, slavefd) ;
        int n;
        char buf[100];
        char *argv[] = { "sh", 0 };


        switch(fork()) {
        case -1:
            break;
        case 0:
            close(0);
            dup(slavefd);
            close(1);
            dup(slavefd);
            close(2);
            dup(slavefd);

            exec("/bin/sh", argv);

            exit();
            break;
        default:
            /*
            write(masterfd, ls, strlen(ls));
            sleep(100);

            char buf[1024];
            int n = read(masterfd, buf, 1024);
            if (n > 0) {
                buf[n] = 0;
                write(1, buf, n);
            }
            */

            break;
        }
    } else {
        printf(2, "error: ret = %d\n", ret);
    }

    FILE *mouse = fopen("/dev/mouse", "w");
    if (mouse == NULL) {
        printf(1, "open /dev/mouse failed\n");
    } else {
        printf(1, "open /dev/mouse succes.\n");
    }

    FILE *kbd = fopen("/dev/kbd", "w");
    if (kbd == NULL) {
        printf(1, "open /dev/kbd failed\n");
    } else {
        printf(1, "open /dev/kbd succes\n");
    }

    int mouse_fd = fgetfd(mouse);
    int kbd_fd = fgetfd(kbd);
    int max_fd = mouse_fd > kbd_fd ? mouse_fd : kbd_fd;
    max_fd = max_fd > masterfd ? max_fd : masterfd;

    char *keys = malloc(512);
    mouse_packet_t *packets = malloc(sizeof(mouse_packet_t) * 1024);

    fd_set fds;
    bool move_win = false;
    do {
        FD_ZERO(&fds);
        FD_SET(mouse_fd, &fds);
        FD_SET(kbd_fd, &fds);
        FD_SET(masterfd, &fds);

        int fd = select(max_fd + 1, &fds, NULL, NULL, NULL);
        printf(2, "select fd = %d\n", fd);
        if (fd == mouse_fd) {
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
                            } else {
                                int x1 = cursor_x - task_x;
                                int y1 = cursor_y - task_y;
                                if (x1 > 4 && x1 < 72 && y1 > 4 && y1 < 24) {
                                    sheet_updown(sht_win, 1);
                                }
                            }
                        } else {
                            move_win = false;
                        }
                    }
                }
            }
        } else if (fd == kbd_fd) {
            memset(keys, 0, 512);
            size_t n = fread(keys, 1, 512, kbd);
            if (n > 0) {
                keys[n] = 0;
                for (int i=0; i<n; i++) {
                    if (y > win_h - 20) {
                        y = 24;
                    }
                    if (keys[i] == '\n' || keys[i] == '\r') {
                        write(masterfd, ls, strlen(ls));

                        y += 20;
                        x = 5;
                        putchar_ascii(buf_win, win_w, x, y, RGB_FFFFFF, '>');
                        sheet_refresh(sht_win, x, y, x + 8, y + 20);
                        x += 8;
                    } else {
                        putchar_ascii(buf_win, win_w, x, y, RGB_FFFFFF, keys[i]);
                        sheet_refresh(sht_win, x, y, x + 8, y + 20);
                        x += 8;
                        if (x > win_w-12) {
                            y += 20;
                            x = 5;
                        }
                    }
                }
            }
        } else if (fd == masterfd){
            char buf[1024];
            int n = read(masterfd, buf, 1024);
            if (n > 0) {
                buf[n] = 0;
                write(1, buf, n);
            }
        } else {
        }
    } while (1);

    close_screen();
    exit();
}
