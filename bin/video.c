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

void init_context(int fd, gfx_context_t* ctx);
#define BUF_SIZE(ctx) (GFX_S(ctx) * GFX_H(ctx) + GFX_W(ctx) * GFX_B(ctx))

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
void win_test(int x, int y, int width, int height, int decors_active);
void draw_fill_pos(gfx_context_t * ctx, int x0, int y0, int w, int h, uint32_t color);

int
main(int argc, char* argv[])
{
    //color_test();
    // png_test();
    // jpg_test();
    win_test(100, 80, 600, 500, 0);
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

void draw_window(gfx_context_t *ctx, int x, int y, int width, int height, int decors_active) {
    draw_sprite(ctx, sprites[decors_active + 0], x, y);
    for (int i = x; i < x + width - (ul_width + ur_width); ++i) {
        draw_sprite(ctx, sprites[decors_active + 1], i + ul_width, y);
    }

    draw_sprite(ctx, sprites[decors_active + 2], x + width - ur_width, y);
    for (int i = y; i < y + height - (u_height + l_height); ++i) {
        draw_sprite(ctx, sprites[decors_active + 3], x, i + u_height);
        draw_sprite(ctx, sprites[decors_active + 4], x + width - mr_width, i + u_height);
    }
    draw_sprite(ctx, sprites[decors_active + 5], x, y + height - l_height);
    for (int i = x; i < x + width - (ll_width + lr_width); ++i) {
        draw_sprite(ctx, sprites[decors_active + 6], i + ll_width, y + height - l_height);
    }
    draw_sprite(ctx, sprites[decors_active + 7], x + width - lr_width, y + height - l_height);

    draw_sprite(ctx, sprites[decors_active + 8], x + width - 28 + BUTTON_OFFSET, y + 16);
    draw_sprite(ctx, sprites[decors_active + 9], x + width - 50 + BUTTON_OFFSET, y + 16);
    draw_fill_pos(ctx, x+6, y + 33, width-12, height-39, rgb(20,20,20));

    char* bash = "artsing";
    int xx = x;
    int yy = y;
    while(*bash) {
        term_write_char(ctx, *bash++, xx+10, yy+33, rgb(255,0,255), rgb(0,0,0));
        xx += char_width;
    }

    bash = "@";
    while(*bash) {
        term_write_char(ctx, *bash++, xx+10, yy+33, rgb(255,255,255), rgb(0,0,0));
        xx += char_width;
    }

    bash = "pangu #";
    while(*bash) {
        term_write_char(ctx, *bash++, xx+10, yy+33, rgb(0,255,0), rgb(0,0,0));
        xx += char_width;
    }

    draw_sdf_string(ctx, x+width/2-10, y+10, "terminal", 16, rgb(255,255,255), SDF_FONT_THIN);
}

void win_test(int x, int y, int width, int height, int decors_active) {
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

    uint32_t bg_color = rgb(255, 255, 255);
    draw_fill(ctx, bg_color);


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

    init_sdf();

    init_sprites();
    printf(1, "finish init sprites. \n");
    uint32_t win_color = alpha_blend_rgba(bg_color, rgba(255, 255, 255, 100));

    // draw window
    draw_window(ctx, x, y, width, height, decors_active);


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

    mouse_packet_t packet = {0};
    int cursor_x=0, cursor_y=0;
    int last_cursor_x = 0, last_cursor_y = 0;
    int window_status = 1;
    int refresh_win = 0;
    do {
        size_t n = fread(&packet, sizeof(mouse_packet_t), 1, mouse);
        if (n == 1) {
            if (packet.magic == MOUSE_MAGIC) {
                // draw background
                if (draw_wallpaper == 1) {
                    memcpy(ctx->backbuffer, bg_ctx->buffer, BUF_SIZE(ctx));
                } else {
                    draw_fill(ctx, bg_color);
                }

                // draw window
                if (packet.buttons == LEFT_CLICK) {
                    window_status = ~window_status;
                    refresh_win = 1;
                    //x += 5;
                } else if (packet.buttons == RIGHT_CLICK) {
                    //y += 5;
                } else {
                    refresh_win = 0;
                }

                if (window_status == 1) {
                    draw_window(ctx, x, y, width, height, decors_active);
                }

                // draw cursor
                cursor_x = cursor_x + packet.x;
                if (cursor_x < 0) cursor_x = 0;
                if (cursor_x > 1440) cursor_x = 1440;

                cursor_y = (cursor_y - packet.y) % 900;
                if (cursor_y < 0) cursor_y = 0;
                if (cursor_y > 900) cursor_y = 900;

                draw_sprite(ctx, &cursor, cursor_x, cursor_y);

                // paint
                // memcpy(ctx->buffer, ctx->backbuffer, BUF_SIZE(ctx));
                if (refresh_win == 1) {
                    for (int y0 = y; y0 < y + height; y0++) {
                    memcpy(&GFXR(ctx, x, y0),
                           &GFX(ctx, x, y0),
                           width * sizeof(uint32_t));
                }

                }
                for (int y0 = last_cursor_y; y0 < last_cursor_y + cursor.height; y0++) {
                    if (y0 > GFX_H(ctx) - cursor.height/2) {
                        break;
                    }
                    memcpy(&GFXR(ctx, last_cursor_x, y0),
                           &GFX(ctx, last_cursor_x, y0),
                           cursor.width * sizeof(uint32_t));
                }

                for (int y0 = cursor_y; y0 < cursor_y + cursor.height; y0++) {
                    if (y0 > GFX_H(ctx) - cursor.height/2) {
                        break;
                    }
                    memcpy(&GFXR(ctx, cursor_x, y0),
                           &GFX(ctx, cursor_x, y0),
                           cursor.width * sizeof(uint32_t));
                }

                last_cursor_x = cursor_x;
                last_cursor_y = cursor_y;
            } else {
                sleep(1);
            }
        } else {
            printf(1, "read mouse position failed \n");
            break;
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

