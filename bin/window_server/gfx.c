#include "gfx.h"

void rectangle_fill(gfx_context_t *ctx, int x0, int y0, int x1, int y1, uint32_t color) {
    for (int y = y0; y <= y1; y++) {
        for (int x = x0; x <= x1; x++) {
            GFX(ctx, x, y) = color;
        }
    }
}

 void putchar_ascii(gfx_context_t *ctx, int x, int y, uint32_t color, int val) {
    uint16_t * c = large_font[val];
    for (uint8_t i = 0; i < char_height; ++i) {
        for (uint8_t j = 0; j < char_width; ++j) {
            if (c[i] & (1 << (15-j))) {
                GFX(ctx, x+j,y+i) = color;
            }
        }
    }
}

void putfonts_ascii(gfx_context_t *ctx, int x, int y, uint32_t c, char* s) {
    extern char hankaku[4096];
        for (; *s != 0x00; s++) {
        putchar_ascii(ctx, x, y, c, *s);
        x += 8;
    }
}

