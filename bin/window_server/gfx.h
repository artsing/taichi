#ifndef _WS_GFX_H_
#define _WS_GFX_H_

#include <stdint.h>
#include <terminal-font.h>

#define SCREEN_B sizeof(uint32_t)
#define SCREEN_S(xsize) (xsize * SCREEN_B)
#define SCREEN_POINT(vram, xsize, x, y) *((uint32_t *)&(vram)[(SCREEN_S(xsize) * (y) + (x) * SCREEN_B)])

static uint16_t char_width  = 12;    /* Width of a cell in pixels */
static uint16_t char_height = 21;   /* Height of a cell in pixels */

extern void rectangle_fill(unsigned char *vram, int xsize, int x0, int y0, int x1, int y1, uint32_t color);
extern void putchar_ascii(unsigned char *vram, int xsize, int x, int y, uint32_t color, int val);
extern void putfonts_ascii(unsigned char *vram, int xsize, int x, int y, uint32_t c, char* s);

#endif
