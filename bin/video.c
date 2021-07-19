#include "types.h"
#include "user.h"
#include "fcntl.h"
#include <math.h>

#define N 7

static inline uint16_t min16(uint16_t a, uint16_t b) {
	return (a < b) ? a : b;
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
 * Macros make everything easier.
 */
#define GFX(ctx,x,y) *((uint32_t *)&((ctx)->buffer)[(GFX_W(ctx) * (y) + (x)) * GFX_B(ctx)])

inline uint32_t rgb(uint8_t r, uint8_t g, uint8_t b) {
	return 0xFF000000 | (r << 16) | (g << 8) | (b);
}

inline uint32_t rgba(uint8_t r, uint8_t g, uint8_t b, uint8_t a) {
	return (a << 24U) | (r << 16) | (g << 8) | (b);
}

uint32_t alpha_blend(uint32_t bottom, uint32_t top, uint32_t mask) {
	uint8_t a = _RED(mask);
	uint8_t red = (_RED(bottom) * (255 - a) + _RED(top) * a) / 255;
	uint8_t gre = (_GRE(bottom) * (255 - a) + _GRE(top) * a) / 255;
	uint8_t blu = (_BLU(bottom) * (255 - a) + _BLU(top) * a) / 255;
	uint8_t alp = (int)a + (int)_ALP(bottom) > 255 ? 255 : a + _ALP(bottom);
	return rgba(red,gre,blu, alp);
}

#define DONT_USE_FLOAT_FOR_ALPHA 1

uint32_t alpha_blend_rgba(uint32_t bottom, uint32_t top) {
	if (_ALP(bottom) == 0) return top;
	if (_ALP(top) == 255) return top;
	if (_ALP(top) == 0) return bottom;
#if DONT_USE_FLOAT_FOR_ALPHA
	uint16_t a = _ALP(top);
	uint16_t c = 255 - a;
	uint16_t b = ((int)_ALP(bottom) * c) / 255;
	uint16_t alp = min16(a + b, 255);
	uint16_t red = min16((uint32_t)(_RED(bottom) * c + _RED(top) * 255) / 255, 255);
	uint16_t gre = min16((uint32_t)(_GRE(bottom) * c + _GRE(top) * 255) / 255, 255);
	uint16_t blu = min16((uint32_t)(_BLU(bottom) * c + _BLU(top) * 255) / 255, 255);
	return rgba(red,gre,blu,alp);
#else
	double a = _ALP(top) / 255.0;
	double c = 1.0 - a;
	double b = (_ALP(bottom) / 255.0) * c;
	double alp = a + b; if (alp > 1.0) alp = 1.0;
	double red = (_RED(bottom) / 255.0) * c + (_RED(top) / 255.0); if (red > 1.0) red = 1.0;
	double gre = (_GRE(bottom) / 255.0) * c + (_GRE(top) / 255.0); if (gre > 1.0) gre = 1.0;
	double blu = (_BLU(bottom) / 255.0) * c + (_BLU(top) / 255.0); if (blu > 1.0) blu = 1.0;
	return rgba(red * 255, gre * 255, blu * 255, alp * 255);
#endif
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

void draw_line(context_t * ctx, int32_t x0, int32_t y0, int32_t x1, int32_t y1, uint32_t color) {
	int deltax = fabs(x1 - x0);
	int deltay = fabs(y1 - y0);
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

void draw_rectangle(context_t *ctx, int32_t x, int32_t y, int32_t w, int32_t h, uint32_t color) {
    draw_line(ctx, x, y, x+w, y, color);
    draw_line(ctx, x, y, x, y+h, color);
    draw_line(ctx, x, y+h, x+w, y+h, color);
    draw_line(ctx, x+w, y, x+w, y+h, color);
}

void draw_fill(context_t *ctx, uint16_t x0, uint16_t y0, uint16_t width, uint16_t height, uint32_t color) {
	for (uint16_t y = y0; y <= y0+height; ++y) {
		for (uint16_t x = x0; x <= x0+ width; ++x) {
			GFX(ctx, x, y) = color;
		}
	}
}


typedef struct position {
    uint16_t x;
    uint16_t y;
} position_t;

void color_test() {
    int fd;
    context_t ctx;
    uint32_t bg_color, top_color;
    int x = 10, y = 10, len = 64;

    fd = open("/dev/fb0", O_RDWR);
    if (fd < 0) {
        printf(2, "open /dev/fb0 failed.\n");
        exit();
    }

    init_context(fd, &ctx);

    bg_color = rgb(255, 255, 255);
    draw_fill(&ctx, 0, 0, ctx.width, ctx.height, bg_color);

    for (int i = 25; i<=255; i+=25) {
        top_color = rgba(12, 255, 0, i);
        draw_fill(&ctx, x + (len + 5)* (i/25-1) , y, len, len, alpha_blend_rgba(bg_color, top_color));
    }

    close(fd);
}

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

int
main(int argc, char* argv[])
{
    moving_block();
    color_test();
    exit();
}
