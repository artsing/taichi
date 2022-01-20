#include <stdint.h>
#include <user.h>
#include <fcntl.h>
#include <graphics.h>

#include "theme.h"
#include "screen.h"
#include "taskbar.h"
#include "window.h"
#include "cursor.h"
#include "sheet.h"

#ifndef BUF_SIZE
#define BUF_SIZE(ctx) (GFX_W(ctx) * GFX_H(ctx) * GFX_B(ctx))
#endif

SCREEN screen;

SCREEN* open_screen() {
    int fd = open("/dev/fb0", O_RDWR);
    if (fd < 0) {
        printf(2, "open /dev/fb0 failed.\n");
        exit();
    }

    SCREEN *ctx = &screen;
    ctx->fd = fd;

    int err = ioctl(fd, 1, &(ctx->width));
    if (err < 0) {
        printf(2, "ioctl /dev/fb0 failed.\n");
    }

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

    printf(1, "screen ={width:%d, height:%d, depth:%d, size:%d, buffer:%x}\n",
           ctx->width,
           ctx->height,
           ctx->depth,
           ctx->size,
           ctx->buffer);
    return ctx;
}

void close_screen() {
    if (screen.fd) {
        close(screen.fd);
    }
}