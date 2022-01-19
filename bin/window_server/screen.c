#include <stdint.h>
#include <user.h>
#include <fcntl.h>
#include <graphics.h>

#include "theme.h"
#include "screen.h"
#include "taskbar.h"
#include "window.h"

#ifndef BUF_SIZE
#define BUF_SIZE(ctx) (GFX_W(ctx) * GFX_H(ctx) * GFX_B(ctx))
#endif

int screen_fd;
gfx_context_t screen;

void open_screen() {
    screen_fd = open("/dev/fb0", O_RDWR);
    if (screen_fd < 0) {
        printf(2, "open /dev/fb0 failed.\n");
        exit();
    }

    int fd = screen_fd;
    gfx_context_t *ctx = &screen;

    int err = ioctl(fd, 1, &(ctx->width));
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

    draw_fill(ctx, RGB_008484);

    draw_taskbar(ctx, ctx->width, ctx->height);

    draw_window(ctx, 100, 100, 320, 200, "Terminal");

    printf(1, "screen ={width:%d, height:%d, depth:%d, size:%d, buffer:%x}\n",
           ctx->width,
           ctx->height,
           ctx->depth,
           ctx->size,
           ctx->buffer);
}

void close_screen() {
    if (screen_fd) {
        close(screen_fd);
    }
}

void blit_screen() {
    gfx_context_t *ctx = &screen;
    memcpy(ctx->buffer, ctx->backbuffer, BUF_SIZE(ctx));
}