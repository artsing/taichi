#ifndef _WS_SHEET_H_
#define _WS_SHEET_H_

#define MAX_SHEETS 256
#include <stdint.h>
#include <user.h>

typedef struct sheet {
    unsigned char *buf;
    int vx0;
    int vy0;
    int bxsize;
    int bysize;
    int height;
    int col_inv;
    int flags;
    struct shtctl *ctl;
} SHEET;

typedef struct shtctl {
    unsigned char *vram;
    unsigned char *map;
    int xsize;
    int ysize;
    int top;
    SHEET *sheets[MAX_SHEETS];
    SHEET sheets0[MAX_SHEETS];
} SHTCTL;


SHTCTL *shtctl_init(unsigned char *vram, int xsize, int ysize);
SHEET *sheet_alloc(SHTCTL *ctl);
void sheet_setbuf(SHEET *sht, unsigned char *buf, int xsize, int ysize, int col_inv);
void sheet_updown(SHEET *sht, int height);
void sheet_refresh(SHEET *sht, int bx0, int by0, int bx1, int by1);
void sheet_slide(SHEET *sht, int vx0, int vy0);
void sheet_free(SHEET *sht);
void dump_map(SHTCTL * ctl);

#endif