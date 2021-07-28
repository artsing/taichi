#include <stdint.h>
#include <math.h>
#include <graphics.h>
#include "user.h"
#include "fcntl.h"
#include <png.h>
#include <jpeg.h>

void init_context(int fd, gfx_context_t* ctx);

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
void win_test(int x, int y, int width, int height, int decors_active);
void draw_fill_pos(gfx_context_t * ctx, int x0, int y0, uint32_t color);

int
main(int argc, char* argv[])
{
    //color_test();
    // png_test();
    // jpg_test();
    win_test(100, 80, 600, 500, 0);
    exit();
}

void win_test(int x, int y, int width, int height, int decors_active) {
    int fd;
    gfx_context_t *ctx = malloc(sizeof(gfx_context_t));
    gfx_context_t *win_ctx = malloc(sizeof(gfx_context_t));

    fd = open("/dev/fb0", O_RDWR);
    if (fd < 0) {
        printf(2, "open /dev/fb0 failed.\n");
        exit();
    }
    printf(1, "fd = %d \n", fd);

    init_context(fd, ctx);

    uint32_t bg_color = rgb(255, 255, 255);
    draw_fill(ctx, bg_color);


    memcpy(win_ctx, ctx, sizeof(gfx_context_t));
    win_ctx->width = width;
    win_ctx->height = height;

    /* Load the wallpaper. */
    /*
	sprite_t wallpaper = { 0 };
	load_sprite_jpg(&wallpaper, "/usr/share/bg.jpg");
	wallpaper.alpha = ALPHA_EMBEDDED;

	printf(1, "wallpaper sprite info: %d x %d\n", wallpaper.width, wallpaper.height);
	draw_sprite_scaled(ctx, &wallpaper, 0, 0, ctx->width, ctx->height);
    */

    init_sprites();
    printf(1, "finish init sprites. \n");
    uint32_t win_color = alpha_blend_rgba(bg_color, rgba(255, 255, 255, 100));
    draw_fill_pos(win_ctx, x, y, win_color);

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

    err = ioctl(fd, 5, &(ctx->backbuffer));
    if (err < 0) {
        printf(2, "ioctl /dev/fb0 failed.\n");
    }

    err = ioctl(fd, 6, &(ctx->size));
    if (err < 0) {
        printf(2, "ioctl /dev/fb0 failed.\n");
    }

    ctx->clips = NULL;

    printf(1, "ctx ={width:%d, height:%d, depth:%d, size:%d, buffer:%x}\n",
           ctx->width,
           ctx->height,
           ctx->depth,
           ctx->size,
           ctx->backbuffer);
}

void init_sprite(int id, char * path) {
	sprites[id] = malloc(sizeof(sprite_t));
	load_sprite_png(sprites[id], path);
    printf(1, "load %s\n", path);
}

void init_sprites() {
    init_sprite(0, "/usr/share/ul.png");
    init_sprite(1, "/usr/share/um.png");
    init_sprite(2, "/usr/share/ur.png");

    init_sprite(3, "/usr/share/ml.png");
    init_sprite(4, "/usr/share/mr.png");

    init_sprite(5, "/usr/share/ll.png");
    init_sprite(6, "/usr/share/lm.png");
    init_sprite(7, "/usr/share/lr.png");

    init_sprite(8, "/usr/share/bt-close.png");
    init_sprite(9, "/usr/share/bt-max.png");
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

void draw_fill_pos(gfx_context_t * ctx, int x0, int y0, uint32_t color) {
    x0 += mr_width;
    y0 += mr_width;
	for (uint16_t y = 0; y < ctx->height - 2*mr_width; ++y) {
		for (uint16_t x = 0; x < ctx->width - 2*mr_width; ++x) {
			GFX(ctx, x + x0, y + y0) = color;
		}
	}
}

