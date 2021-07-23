#include <stdint.h>
#include <math.h>
#include <graphics.h>
#include "user.h"
#include "fcntl.h"
#include <png.h>

#define N 7

void init_context(int fd, gfx_context_t* ctx) {
    int err;

    fd = open("/dev/fb0", O_RDWR);
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

typedef struct position {
    uint16_t x;
    uint16_t y;
} position_t;

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

    bg_color = rgb(255, 255, 255);
    draw_fill(&ctx, bg_color);

    sprite_t *png = create_sprite(64, 64, 100);

    int err = load_sprite_png(png, "favicon.png");
    printf(1, "err = %d\n", err);

    draw_sprite(&ctx, png, 10, 10);

    close(fd);
}
/*
void moving_block() {
    int fd;
    context_t ctx;
    uint32_t color, green, block_cr;
    position_t p;
    p.x = 11;
    p.y = 11;

    fd = open("/dev/fb0", O_RDWR);
    if (fd < 0) {
        printf(2, "open /dev/fb0 failed.\n");
        exit();
    }

    init_context(fd, &ctx);
    color = rgb(255, 255, 255);
    green = rgb(0, 255, 0);
    block_cr = rgb(255, 0, 0);
    // draw background
    draw_fill(&ctx, 0, 0, ctx.width, ctx.height, color);
    draw_rectangle(&ctx, p.x-2, p.y-2, 300, 300, green);

    int flag = 1;
    int k = 0;
    for (int x = 1; x < 1000; x++) {
        //ioctl(fd, 7, &p);
        draw_fill(&ctx, p.x, p.y, 20, 20, color);
        if (p.x > 300-17 || p.y > 300-17) {
            k = 1;
            block_cr = rgb(0, 0, 255);
        }

        if (p.x < 11 || p.y < 11) {
            k = 0;
            block_cr = rgb(255, 0, 0);
        }

        if (k == 0) {
            p.x += 1;
            p.y += 1;
        } else {
            p.x -= 1;
            p.y -= 1;
        }

        draw_fill(&ctx, p.x, p.y, 20, 20, block_cr);
        printf(1, "\r{%d, %d}", p.x, p.y);
        sleep(1);
    }

    close(fd);
}
*/
int
main(int argc, char* argv[])
{
 //   moving_block();
    color_test();
    exit();
}
