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


static int PREFERRED_W = 1440;
static int PREFERRED_H = 900;
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

int
lbf_video_ioctl(struct inode* ip, int req, void* arg) {
    if (req == 1) {
        return (int)lfb_resolution_x;
    } else if (req == 2) {
        return (int)lfb_resolution_y;
    } else if (req == 3) {
        return (int)lfb_resolution_b;
    } else if (req == 4) {
        return (int)lfb_resolution_s;
    } else if (req == 5) {
        *((uintptr_t *)arg) = (uintptr_t)lfb_vid_memory;
        return 5;
    } else if (req == 6) {
        return (int)lfb_memsize;
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
