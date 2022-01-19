#ifndef _WS_WINDOW_H_
#define _WS_WINDOW_H_

#include <stdint.h>
#include <graphics.h>
#include "theme.h"
#include "gfx.h"

void draw_window(gfx_context_t *ctx, int x, int y, int xsize, int ysize, char *title);

#endif