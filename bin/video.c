#include <stdint.h>
#include <math.h>
#include <graphics.h>
#include "user.h"
#include "fcntl.h"
#include <png.h>
#include <jpeg.h>
#include <sdf.h>
#include <mouse.h>
#include <stdio.h>
#include <terminal-font.h>

#define RGB_000000 rgb(0, 0, 0)
#define RGB_000084 rgb(0, 0, 132)
#define RGB_008484 rgb(0, 132, 132)
#define RGB_848484 rgb(132, 132, 132)
#define RGB_C6C6C6 rgb(198, 198, 198)
#define RGB_FFFFFF rgb(255, 255, 255)

void init_context(int fd, gfx_context_t* ctx);
#define BUF_SIZE(ctx) (GFX_W(ctx) * GFX_H(ctx) * GFX_B(ctx))

static sprite_t * sprites[20];
void init_sprite(int id, char * path);
void init_sprites();
#define BUTTON_OFFSET 5

static int u_height = 33;
static int ul_width = 10;
static int ur_width = 10;
static int mr_width = 6;
static int l_height = 9;
static int ll_width = 9;
static int lr_width = 9;

void color_test();
void png_test();
void jpg_test();
void sdf_test();
void win_test(int x, int y, int width, int height);
void draw_fill_pos(gfx_context_t * ctx, int x0, int y0, int w, int h, uint32_t color);
void rectangle_fill(gfx_context_t* ctx, int x0, int y0, int x1, int y1, uint32_t color);

int
main(int argc, char* argv[])
{
    //color_test();
    // png_test();
    // jpg_test();
    win_test(100, 80, 320, 200);
    exit();
}

void sdf_test(gfx_context_t *ctx) {
    int size = 16;
}

static uint16_t char_width     = 9;    /* Width of a cell in pixels */
static uint16_t char_height    = 20;   /* Height of a cell in pixels */

void term_write_char(gfx_context_t *ctx, int val, int x, int y, uint32_t fg, uint32_t bg) {
    uint16_t * c = large_font[val];
    for (uint8_t i = 0; i < char_height; ++i) {
        for (uint8_t j = 0; j < char_width; ++j) {
            if (c[i] & (1 << (15-j))) {
                GFX(ctx, x+j,y+i) = fg;
            } else {
                GFX(ctx, x+j,y+i) = bg;
            }
        }
    }
}

void putchar_ascii(gfx_context_t *ctx, int x, int y, uint32_t color, int val) {
    uint16_t * c = large_font[val];
    for (uint8_t i = 0; i < char_height; ++i) {
        for (uint8_t j = 0; j < char_width; ++j) {
            if (c[i] & (1 << (15-j))) {
                GFX(ctx, x+j,y+i) = color;
            }
        }
    }
}

void putfonts_ascii(gfx_context_t *ctx, int x, int y, uint32_t c, char* s) {
    extern char hankaku[4096];
        for (; *s != 0x00; s++) {
        putchar_ascii(ctx, x, y, c, *s);
        x += 8;
    }
}

void draw_window(gfx_context_t *ctx, int x, int y, int xsize, int ysize, char *title) {
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

    rectangle_fill(ctx, x,             y,             x + xsize - 1, y,             RGB_C6C6C6);
    rectangle_fill(ctx, x + 1,         y + 1,         x + xsize - 2, y + 1,         RGB_FFFFFF);
    rectangle_fill(ctx, x,             y,             x,             y + ysize - 1, RGB_C6C6C6);
    rectangle_fill(ctx, x + 1,         y + 1,         x + 1,         y + ysize - 2, RGB_FFFFFF);
    rectangle_fill(ctx, x + xsize - 2, y + 1,         x + xsize - 2, y + ysize - 2, RGB_848484);
    rectangle_fill(ctx, x + xsize - 1, y,             x + xsize - 1, y + ysize - 1, RGB_000000);
    rectangle_fill(ctx, x + 2,         y + 2,         x + xsize - 3, y + ysize - 3, RGB_C6C6C6);
    rectangle_fill(ctx, x + 3,         y + 3,         x + xsize - 4, y + 20,        RGB_000084);
    rectangle_fill(ctx, x + 1,         y + ysize - 2, x + xsize - 2, y + ysize - 2, RGB_848484);
    rectangle_fill(ctx, x,             y + ysize - 1, x + xsize - 1, y + ysize - 1, RGB_000000);

    putfonts_ascii(ctx, x + 6, y+2, RGB_FFFFFF, title);

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
            GFX(ctx, x+xsize-21+x1, y+y1+5) = color;
        }
    }
}

void win_test(int x, int y, int width, int height) {
    int fd;
    gfx_context_t *ctx = malloc(sizeof(gfx_context_t));
    gfx_context_t *bg_ctx = malloc(sizeof(gfx_context_t));

    fd = open("/dev/fb0", O_RDWR);
    if (fd < 0) {
        printf(2, "open /dev/fb0 failed.\n");
        exit();
    }
    printf(1, "fd = %d \n", fd);

    init_context(fd, ctx);
    int xsize = ctx->width;
    int ysize = ctx->height;

    // background
    draw_fill(ctx, RGB_008484);

    memcpy(bg_ctx, ctx, sizeof(gfx_context_t));
    bg_ctx->buffer = malloc(BUF_SIZE(ctx));

    // Load the wallpaper.
    int draw_wallpaper = 0;
    sprite_t wallpaper = { 0 };
    if (draw_wallpaper == 1) {
        load_sprite_jpg(&wallpaper, "/usr/share/bg.jpg");
        wallpaper.alpha = ALPHA_EMBEDDED;

        printf(1, "wallpaper sprite info: %d x %d\n", wallpaper.width, wallpaper.height);
        draw_sprite_scaled(ctx, &wallpaper, 0, 0, ctx->width, ctx->height);
        memcpy(bg_ctx->buffer, ctx->backbuffer, BUF_SIZE(ctx));
    }

    // task bar
    rectangle_fill(ctx, 0, ysize - 28, xsize - 1, ysize - 28, RGB_C6C6C6);
    rectangle_fill(ctx, 0, ysize - 27, xsize - 1, ysize - 27, RGB_FFFFFF);
    rectangle_fill(ctx, 0, ysize - 26, xsize - 1, ysize - 1, RGB_C6C6C6);

    rectangle_fill(ctx, 3,  ysize - 24, 59, ysize - 24, RGB_FFFFFF);
    rectangle_fill(ctx, 2,  ysize - 24, 2,  ysize - 4,  RGB_FFFFFF);
    rectangle_fill(ctx, 3,  ysize - 4,  59, ysize - 4,  RGB_848484);
    rectangle_fill(ctx, 59, ysize - 23, 59, ysize - 5,  RGB_848484);
    rectangle_fill(ctx, 2,  ysize - 3,  59, ysize - 3,  RGB_000000);
    rectangle_fill(ctx, 60, ysize - 24, 60, ysize - 3,  RGB_000000);

    rectangle_fill(ctx, xsize - 47, ysize - 24, xsize - 4,  ysize - 24, RGB_848484);
    rectangle_fill(ctx, xsize - 47, ysize - 23, xsize - 47, ysize - 4, RGB_848484);
    rectangle_fill(ctx, xsize - 47, ysize - 3,  xsize - 4,  ysize - 3, RGB_848484);
    rectangle_fill(ctx, xsize - 47, ysize - 24, xsize - 3,  ysize - 3, RGB_848484);

    putfonts_ascii(ctx, 10,  ysize-24, RGB_000000, "pangu");

    sprite_t terminal = {0};
    int terminal_x = 10;
    int terminal_y = 40;
    int terminal_w = 56;
    int terminal_h = 56;
    int terminal_mouse_in = 0;
    //load_sprite(&terminal, "/usr/share/icons/terminal.png");
    //draw_sprite_scaled(ctx, &terminal, terminal_x, terminal_y, terminal_w, terminal_h);

    //init_sdf();

    // draw window
    draw_window(ctx, x, y, width, height, "Terminal");
    memcpy(bg_ctx->buffer, bg_ctx->backbuffer, BUF_SIZE(ctx));

    memcpy(ctx->buffer, ctx->backbuffer, BUF_SIZE(ctx));

    sprite_t cursor = {0};
    load_sprite(&cursor, "/usr/share/cursor/normal.png");
    draw_sprite(ctx, &cursor, x+ width/2, y + height/2);

    FILE *mouse = fopen("/dev/mouse", "w");
    if (mouse == NULL) {
        printf(1, "open /dev/mouse failed\n");
        close(fd);
        return;
    } else {
        printf(1, "open /dev/mouse succes.\n");
    }

    mouse_packet_t *packets = malloc(sizeof(mouse_packet_t) * 1024);
    int cursor_x=0, cursor_y=0;
    int last_cursor_x = 0, last_cursor_y = 0;
    int refresh_cursor;
    int window_status = 1;
    int refresh_win = 0;
    int refresh_rmenu = 0;

    do {
        size_t n = fread(packets, sizeof(mouse_packet_t), 1024, mouse);
        if (n > 0) {
            for (int i=0; i<n; i++) {
                mouse_packet_t packet = packets[i];
                if (packet.magic == MOUSE_MAGIC) {
                    // update cursor position x and y
                    cursor_x = cursor_x + packet.x;
                    if (cursor_x < 0) cursor_x = 0;
                    if (cursor_x > 1440) cursor_x = 1440;

                    cursor_y = cursor_y - packet.y;
                    if (cursor_y < 0) cursor_y = 0;
                    if (cursor_y > 924) cursor_y = 924;

                    if (cursor_x == last_cursor_x && cursor_y == last_cursor_y) {
                        refresh_cursor = 0;
                    } else {
                        refresh_cursor = 1;
                    }

                    if (packet.buttons == LEFT_CLICK) {
                        window_status = ~window_status;
                        refresh_rmenu = 0;
                    } else if (packet.buttons == RIGHT_CLICK) {
                        refresh_rmenu = 1;
                    } else {
                        refresh_win = 0;
                        refresh_rmenu = 0;
                    }

                    // mouse in window
                    if (cursor_x > x && cursor_x < x + width
                        && cursor_y > y && cursor_y < y + height) {
                        refresh_win = 1;
                    } else {
                        refresh_win = 1;
                    }

                    if (cursor_x > terminal_x && cursor_x < terminal_x + 56
                        && cursor_y > terminal_y && cursor_y > terminal_y + 56) {
                        terminal_mouse_in = 1;
                    } else {
                        terminal_mouse_in = 0;
                    }

                    if (i % n == 0) {
                        if (refresh_cursor) {
                            for (int y0 = last_cursor_y; y0 < last_cursor_y + cursor.height; y0++) {
                                if (y0 > GFX_H(ctx)) {
                                    break;
                                }
                                memcpy(&GFX(ctx, last_cursor_x, y0),
                                    &GFXR(bg_ctx, last_cursor_x, y0),
                                    cursor.width * sizeof(uint32_t));
                            }
                        }

                        if (terminal_mouse_in) {
                            draw_sprite_scaled_alpha(ctx, &terminal, terminal_x, terminal_y, terminal_w, terminal_h, 0.5);
                        }

                        // draw window
                        if (window_status == 1) {
                            for (int y0 = y; y0 < y + height; y0++) {
                                memcpy(&GFX(ctx, x, y0),
                                    &GFXR(bg_ctx, x, y0),
                                    width * sizeof(uint32_t));
                            }

                            draw_window(ctx, x, y, width, height, "Terminal");
                        }

                        // right menu
                        if (refresh_rmenu) {
                            draw_rectangle(ctx, cursor_x, cursor_y, 200, 300, rgb(200,200,200));
                        }

                        // draw cursor
                        draw_sprite(ctx, &cursor, cursor_x, cursor_y);

                    }


                    if (i % n == 0) {
                        // flib terminal
                        if (terminal_mouse_in) {
                            for (int y0 = terminal_y; y0 < terminal_y + terminal_h; y0++) {
                                memcpy(&GFXR(ctx, terminal_x, y0),
                                       &GFX(ctx, terminal_x, y0),
                                       terminal_w * sizeof(uint32_t));
                            }
                        }
                        // flib window
                        if (refresh_win == 1) {
                            for (int y0 = y; y0 < y + height; y0++) {
                                memcpy(&GFXR(ctx, x, y0),
                                       &GFX(ctx, x, y0),
                                       width * sizeof(uint32_t));
                            }
                        }

                        // flib old cursor
                        if (refresh_cursor) {
                            for (int y0 = last_cursor_y; y0 < last_cursor_y + cursor.height; y0++) {
                                if (y0 > GFX_H(ctx)) {
                                    break;
                                }
                                memcpy(&GFXR(ctx, last_cursor_x, y0),
                                    &GFX(ctx, last_cursor_x, y0),
                                    cursor.width * sizeof(uint32_t));
                            }
                        }

                        if (refresh_rmenu) {
                            for (int y0 = cursor_y; y0 < cursor_y + 300; y0++) {
                                if (y0 > GFX_H(ctx)) {
                                    break;
                                }
                                memcpy(&GFXR(ctx, cursor_x, y0),
                                    &GFX(ctx, cursor_x, y0),
                                    200 * sizeof(uint32_t));
                            }

                        }

                        // flib new cursor
                        for (int y0 = cursor_y; y0 < cursor_y + cursor.height; y0++) {
                            if (y0 > GFX_H(ctx)) {
                                break;
                            }
                            memcpy(&GFXR(ctx, cursor_x, y0),
                                &GFX(ctx, cursor_x, y0),
                                cursor.width * sizeof(uint32_t));
                        }

                        // update last cursor position
                        last_cursor_x = cursor_x;
                        last_cursor_y = cursor_y;
                    }
                } else {
                    //sleep(1);
                }
            }
        } else {
            //sleep(1);
        }
    } while (1);

    close(fd);
}

void init_context(int fd, gfx_context_t* ctx) {
    int err;

    //fd = open("/dev/fb0", O_RDWR);
    if (fd < 0) {
        printf(2, "open /dev/fb0 failed.\n");
        exit();
    }

    err = ioctl(fd, 1, &(ctx->width));
    if (err < 0) {
        printf(2, "ioctl /dev/fb0 failed.\n");
    }
    ctx->stride = ctx->width * 4;

    err = ioctl(fd, 2, &(ctx->height));
    if (err < 0) {
        printf(2, "ioctl /dev/fb0 failed.\n");
    }

    err = ioctl(fd, 3, &(ctx->depth));
    if (err < 0) {
        printf(2, "ioctl /dev/fb0 failed.\n");
    }

    err = ioctl(fd, 5, &(ctx->buffer));
    if (err < 0) {
        printf(2, "ioctl /dev/fb0 failed.\n");
    }

    err = ioctl(fd, 6, &(ctx->size));
    if (err < 0) {
        printf(2, "ioctl /dev/fb0 failed.\n");
    }

    ctx->clips = NULL;
    int size = BUF_SIZE(ctx);
    ctx->backbuffer = malloc(size);

    printf(1, "ctx ={width:%d, height:%d, depth:%d, size:%d, buffer:%x}\n",
           ctx->width,
           ctx->height,
           ctx->depth,
           ctx->size,
           ctx->buffer);
}

void init_sprite(int id, char * path) {
	sprites[id] = malloc(sizeof(sprite_t));
	load_sprite_png(sprites[id], path);
    printf(1, "load %s\n", path);
}

void init_sprites() {
    init_sprite(0, "/usr/share/active/ul.png");
    init_sprite(1, "/usr/share/active/um.png");
    init_sprite(2, "/usr/share/active/ur.png");

    init_sprite(3, "/usr/share/active/ml.png");
    init_sprite(4, "/usr/share/active/mr.png");

    init_sprite(5, "/usr/share/active/ll.png");
    init_sprite(6, "/usr/share/active/lm.png");
    init_sprite(7, "/usr/share/active/lr.png");

    init_sprite(8, "/usr/share/active/bt-close.png");
    init_sprite(9, "/usr/share/active/bt-max.png");

    init_sprite(10, "/usr/share/inactive/ul.png");
    init_sprite(11, "/usr/share/inactive/um.png");
    init_sprite(12, "/usr/share/inactive/ur.png");

    init_sprite(13, "/usr/share/inactive/ml.png");
    init_sprite(14, "/usr/share/inactive/mr.png");

    init_sprite(15, "/usr/share/inactive/ll.png");
    init_sprite(16, "/usr/share/inactive/lm.png");
    init_sprite(17, "/usr/share/inactive/lr.png");

    init_sprite(18, "/usr/share/inactive/bt-close.png");
    init_sprite(19, "/usr/share/inactive/bt-max.png");

}

void color_test() {
    int fd;
    gfx_context_t ctx;
    uint32_t bg_color;

    fd = open("/dev/fb0", O_RDWR);
    if (fd < 0) {
        printf(2, "open /dev/fb0 failed.\n");
        exit();
    }
    printf(1, "fd = %d \n", fd);

    init_context(fd, &ctx);

    bg_color = rgb(62, 62, 62);
    draw_fill(&ctx, bg_color);
    close(fd);
}


void png_test() {
    int fd;
    gfx_context_t ctx;
    uint32_t bg_color;

    fd = open("/dev/fb0", O_RDWR);
    if (fd < 0) {
        printf(2, "open /dev/fb0 failed.\n");
        exit();
    }
    printf(1, "fd = %d \n", fd);

    init_context(fd, &ctx);

    bg_color = rgb(255, 255, 255);
    draw_fill(&ctx, bg_color);

	sprite_t sprite = { 0 };

    int err = load_sprite_png(&sprite, "/usr/share/favicon.png");
    if (err < 0) {
        printf(1, "err = %d\n", err);
        close(fd);
        return;
    }

    //draw_sprite_scaled(&ctx, &sprite, 10, 10, sprite.width, sprite.height);

    for (int i=0; i<1000; i += 10) {
        draw_fill(&ctx, bg_color);
        draw_sprite_rotate(&ctx, &sprite, 200, 200, i, 1);
        sleep(30);
        if (i==360) {
            i = 0;
        }
    }

    draw_sprite(&ctx, &sprite, 100, 10);

    close(fd);
}

void jpg_test() {
    int fd;
    gfx_context_t ctx;

    fd = open("/dev/fb0", O_RDWR);
    if (fd < 0) {
        printf(2, "open /dev/fb0 failed.\n");
        exit();
    }
    printf(1, "fd = %d \n", fd);

    init_context(fd, &ctx);

   /* Load the wallpaper. */
	sprite_t wallpaper = { 0 };
	load_sprite_jpg(&wallpaper, "/usr/share/bg.jpg");
	wallpaper.alpha = ALPHA_EMBEDDED;

	printf(1, "wallpaper sprite info: %d x %d\n", wallpaper.width, wallpaper.height);

	draw_sprite_scaled(&ctx, &wallpaper, 0, 0, 1440, 900);
    close(fd);
}

void draw_fill_pos(gfx_context_t * ctx, int x0, int y0, int width, int height, uint32_t color) {
	for (uint16_t y = y0; y < y0 + height; ++y) {
		for (uint16_t x = x0; x < x0 + width; ++x) {
			GFX(ctx, x, y) = color;
		}
	}
}

void rectangle_fill(gfx_context_t* ctx, int x0, int y0, int x1, int y1, uint32_t color) {
    for (uint16_t y = y0; y <= y1; y++) {
        for (uint16_t x = x0; x <= x1; x++) {
             GFX(ctx, x, y) = color; 
        }
    }
}

