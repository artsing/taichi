#ifndef _WS_WINDOW_H_
#define _WS_WINDOW_H_

#include <stdint.h>
#include "theme.h"
#include "gfx.h"
#include "sheet.h"

void draw_window(unsigned char *ctx, int xsize, int ysize, char *title);
void make_textbox(SHEET *sht, int x0, int y0, int sx, int sy, int c);

#endif