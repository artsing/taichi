#ifndef _WS_TASKBAR_H_
#define _WS_TASKBAR_H_

#include <stdint.h>
#include "theme.h"
#include "gfx.h"
#include "sheet.h"

extern void draw_taskbar(unsigned char *vram, int xsize, int ysize);
extern void add_taskbar_btn(SHEET *sheet, char *title);

#endif