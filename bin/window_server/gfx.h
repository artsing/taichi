#ifndef _WS_GFX_H_
#define _WS_GFX_H_

#include <stdint.h>
#include <graphics.h>
#include <terminal-font.h>

#define BUF_SIZE(ctx) (GFX_W(ctx) * GFX_H(ctx) * GFX_B(ctx))

static uint16_t char_width  = 9;    /* Width of a cell in pixels */
static uint16_t char_height = 21;   /* Height of a cell in pixels */

extern void rectangle_fill(gfx_context_t *ctx, int x0, int y0, int x1, int y1, uint32_t color);
extern void putchar_ascii(gfx_context_t *ctx, int x, int y, uint32_t color, int val);
extern void putfonts_ascii(gfx_context_t *ctx, int x, int y, uint32_t c, char* s);

#endif
