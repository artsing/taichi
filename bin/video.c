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

    sprite_t *sprite = create_sprite(1024, 768, 100);
    int err = load_sprite_png(sprite, "favicon.png");
    if (err < 0) {
        printf(1, "err = %d\n", err);
        close(fd);
        return;
    }

    //draw_sprite_scaled(&ctx, sprite, 0, 0, 100, 100);
    /*
    for (int i=0; i<1000; i += 10) {
        draw_fill(&ctx, bg_color);
        draw_sprite_rotate(&ctx, sprite, 200, 200, i, 1);
        sleep(30);
        if (i==360) {
            i = 0;
        }
    }
    */
    draw_sprite(&ctx, sprite, 0, 0);
    close(fd);
}

int
main(int argc, char* argv[])
{
    png_test();
    exit();
}
