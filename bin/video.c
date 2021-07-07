#include "types.h"
#include "user.h"
#include "fcntl.h"

#define N 7

int abs(int a) {
    if (a < 0) {
        return -a;
    } else {
        return a;
    }
}

typedef struct context_s {
	uint16_t width;
	uint16_t height;
	uint16_t depth;
	uint32_t size;
	char *   buffer;
} context_t;

#define GFX_W(ctx)  ((ctx)->width)			/* Display width */
#define GFX_H(ctx)  ((ctx)->height)			/* Display height */
#define GFX_B(ctx)  ((ctx)->depth / 8)		/* Display byte depth */

#define _RED(color) ((color & 0x00FF0000) / 0x10000)
#define _GRE(color) ((color & 0x0000FF00) / 0x100)
#define _BLU(color) ((color & 0x000000FF) / 0x1)
#define _ALP(color) ((color & 0xFF000000) / 0x1000000)

/*
 * Macros make verything easier.
 */
#define GFX(ctx,x,y) *((uint32_t *)&((ctx)->buffer)[(GFX_W(ctx) * (y) + (x)) * GFX_B(ctx)])

uint32_t rgb(uint8_t r, uint8_t g, uint8_t b) {
	return 0xFF000000 + (r * 0x10000) + (g * 0x100) + (b * 0x1);
}

void init_context(int fd, context_t* ctx) {
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

    printf(1, "ctx ={width:%d, height:%d, depth:%d, size:%d, buffer:%x}\n",
           ctx->width,
           ctx->height,
           ctx->depth,
           ctx->size,
           ctx->buffer);
}

void draw_line(context_t * ctx, int32_t x0, int32_t x1, int32_t y0, int32_t y1, uint32_t color) {
	int deltax = abs(x1 - x0);
	int deltay = abs(y1 - y0);
	int sx = (x0 < x1) ? 1 : -1;
	int sy = (y0 < y1) ? 1 : -1;
	int error = deltax - deltay;
	while (1) {
		if (x0 >= 0 && y0 >= 0 && x0 < ctx->width && y0 < ctx->height) {
			GFX(ctx, x0, y0) = color;
		}
		if (x0 == x1 && y0 == y1) break;
		int e2 = 2 * error;
		if (e2 > -deltay) {
			error -= deltay;
			x0 += sx;
		}
		if (e2 < deltax) {
			error += deltax;
			y0 += sy;
		}
	}
}

typedef struct position {
    uint16_t x;
    uint16_t y;
} position_t;

int
main(int argc, char* argv[])
{
    int fd;
    context_t ctx;
    //uint32_t color;
    position_t p;
    p.x = 10;
    p.y = 10;

    fd = open("/dev/fb0", O_RDWR);
    if (fd < 0) {
        printf(2, "open /dev/fb0 failed.\n");
        exit();
    }

    init_context(fd, &ctx);
    //color = rgb(222,0,0);

    //draw_line(&ctx, 0, 400, 0, 400, color);
    int flag = 1;
    int k = 0;
    for (int x = 1; x < 100000; x++) {
        ioctl(fd, 7, &p);
        if (p.x > 500 || p.y > 500) {
            k = 1;
        }

        if (p.x < 10 || p.y < 10) {
            k = 0;
        }

        if (k == 0) {
            p.x += 1;
            p.y += 1;
        } else {
            p.x -= 1;
            p.y -= 1;
        }
        printf(1, "\r{%d, %d}", p.x, p.y);
        sleep(1);
    }

    close(fd);
    exit();
}
