#include "types.h"
#include "defs.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "pci.h"
#include "traps.h"
#include "spinlock.h"
#include "sleeplock.h"
#include "fs.h"
#include "file.h"
#include "proc.h"
#include "x86.h"


static int PREFERRED_W = 1024;
static int PREFERRED_H = 768;
#define PREFERRED_VY 4096
#define PREFERRED_B 32

#define BOCHS_MMIO_ID       0x00
#define BOCHS_MMIO_FBWIDTH  0x02
#define BOCHS_MMIO_FBHEIGHT 0x04
#define BOCHS_MMIO_BPP      0x06
#define BOCHS_MMIO_ENABLED  0x08
#define BOCHS_MMIO_VIRTX    0x0c
#define BOCHS_MMIO_VIRTY    0x0e

/* Exported to other modules */
uint16_t lfb_resolution_x = 0;
uint16_t lfb_resolution_y = 0;
uint16_t lfb_resolution_b = 0;
uint32_t lfb_resolution_s = 0;
uint8_t * lfb_vid_memory = (uint8_t *)0xE0000000;
size_t lfb_memsize = 0xFF0000;
const char * lfb_driver_name = "bochs";

uintptr_t lfb_bochs_mmio = 0;

#define GFX(x,y) *((uint32_t *)&(lfb_vid_memory)[((lfb_resolution_x) * (y) + (x)) * (lfb_resolution_b/8)])

static void bochs_mmio_out(int off, uint16_t val) {
	*(volatile uint16_t*)(lfb_bochs_mmio + 0x500 + off) = val;
}

static uint16_t bochs_mmio_in(int off) {
	return *(volatile uint16_t*)(lfb_bochs_mmio + 0x500 + off);
}

static void bochs_set_resolution(uint16_t x, uint16_t y) {
	bochs_mmio_out(BOCHS_MMIO_ENABLED,  0);
	bochs_mmio_out(BOCHS_MMIO_FBWIDTH,  x);
	bochs_mmio_out(BOCHS_MMIO_FBHEIGHT, y);
	bochs_mmio_out(BOCHS_MMIO_BPP, PREFERRED_B);
	bochs_mmio_out(BOCHS_MMIO_VIRTX, x * (PREFERRED_B  / 8));
	bochs_mmio_out(BOCHS_MMIO_VIRTY, y);
	bochs_mmio_out(BOCHS_MMIO_ENABLED,  0x41);

    *(volatile uint8_t*)(lfb_bochs_mmio + 0x400) = 0x20;

	lfb_resolution_x = bochs_mmio_in(BOCHS_MMIO_FBWIDTH);
	lfb_resolution_y = bochs_mmio_in(BOCHS_MMIO_FBHEIGHT);
	lfb_resolution_b = bochs_mmio_in(BOCHS_MMIO_BPP);
	lfb_resolution_s = lfb_resolution_x * 4;

    cprintf("[LBF][bochs_set_resolution] x = %d y = %d.\n", lfb_resolution_x, lfb_resolution_y);
}

int
lbf_video_read(struct inode *ip, char *dst, int n)
{
    return 0;
}

int
lbf_video_write(struct inode *ip, char *buf, int n)
{
    return 0;
}

uint32_t
rgb(uint8_t r, uint8_t g, uint8_t b) {
	return 0xFF000000 + (r * 0x10000) + (g * 0x100) + (b * 0x1);
}

int _abs(int x) {
    return x > 0 ? x:-x;
}

void draw_line(int32_t x0, int32_t y0, int32_t x1, int32_t y1, uint32_t color) {
	int deltax = _abs(x1 - x0);
	int deltay = _abs(y1 - y0);
	int sx = (x0 < x1) ? 1 : -1;
	int sy = (y0 < y1) ? 1 : -1;
	int error = deltax - deltay;
	while (1) {
		if (x0 >= 0 && y0 >= 0 && x0 < lfb_resolution_x && y0 < lfb_resolution_y) {
			GFX(x0, y0) = color;
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
void draw_rectangle(int32_t x, int32_t y, int32_t w, int32_t h, uint32_t color) {
    draw_line(x, y, x+w, y, color);
    draw_line(x, y, x, y+h, color);
    draw_line(x, y+h, x+w, y+h, color);
    draw_line(x+w, y, x+w, y+h, color);
}

static void set_point(int x, int y, uint32_t value) {
	uint32_t * disp = (uint32_t *)lfb_vid_memory;
	uint32_t * cell = &disp[y * (lfb_resolution_s / 4) + x];
	*cell = value;
}

void draw_fill(uint16_t x0, uint16_t y0, uint16_t width, uint16_t height, uint32_t color) {
	for (uint16_t y = y0; y <= y0+height; ++y) {
		for (uint16_t x = x0; x <= x0+ width; ++x) {
			GFX(x, y) = color;
		}
	}
}

typedef struct position {
    uint16_t x;
    uint16_t y;
} position_t;

int
lbf_video_ioctl(struct inode* ip, int req, void* arg) {
    if (req == 1) {
        *((uint16_t*)arg) = lfb_resolution_x;
        return 1;
    } else if (req == 2) {
        *((uint16_t*)arg) = lfb_resolution_y;
        return 1;
    } else if (req == 3) {
        *((uint16_t*)arg) = lfb_resolution_b;
        return 1;
    } else if (req == 4) {
        *((uint16_t*)arg) = lfb_resolution_s;
        return 1;
    } else if (req == 5) {
        *((uintptr_t *)arg) = (uintptr_t)lfb_vid_memory;
        return 1;
    } else if (req == 6) {
        *((uintptr_t *)arg) = lfb_memsize;
        return 1;
    } else if (req == 7) {
        position_t* p = (position_t*)arg;
        int x = p->x;
        int y = p->y;

        static int x0, y0;
        static int flag = 0;

        if (flag == 0) {
            // background
            draw_fill(0, 0, PREFERRED_W, PREFERRED_H, rgb(255,255,255));
            flag = 1;
        }

        draw_fill(x0, y0, 40, 40, rgb(255,255,255));
        draw_fill(x, y, 40, 40, rgb(55,155,255));
        //draw_rectangle(x, y, 40, 40, rgb(255,0,0));
        x0 = x;
        y0 = y;

    }

    return -1;
}

int
lbf_video_init(struct pci_func *pcif)
{
    cprintf("[LBF][lbf_vide_init] dev_id = %02x dev_class = %02x.\n",
            pcif->dev_id, pcif->dev_class);
    pci_func_enable(pcif);

    lfb_vid_memory = (uint8_t *) pcif->reg_base[0];
    lfb_bochs_mmio = (uintptr_t) pcif->reg_base[2];
    lfb_memsize = pcif->reg_size[0];

    cprintf("[LBF][lbf_video_init] lfb_vid_memory = %02x \t lfb_bochs_mmio = %02x \t lfb_memsize = %02x.\n",
            lfb_vid_memory, lfb_bochs_mmio, lfb_memsize);

    uint16_t i = bochs_mmio_in(BOCHS_MMIO_ID);
	if (i < 0xB0C0 || i > 0xB0C6) {
        cprintf("[LBF][lbf_video_init] error unsupported bochs device.");
        return -1;
    }

    bochs_mmio_out(BOCHS_MMIO_ID, 0xB0C4);
    bochs_set_resolution(PREFERRED_W, PREFERRED_H);

    devsw[LBF].write = lbf_video_write;
    devsw[LBF].read = lbf_video_read;
    devsw[LBF].ioctl = lbf_video_ioctl;

    return 0;
}
