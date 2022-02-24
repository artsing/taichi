#include "types.h"
#include "defs.h"
#include "param.h"
#include "traps.h"
#include "spinlock.h"
#include "sleeplock.h"
#include "fs.h"
#include "file.h"
#include "x86.h"
#include "mouse.h"
#
static uint8_t mouse_cycle = 0;
static uint8_t mouse_byte[4];

#define MOUSE_PORT   0x60
#define MOUSE_STATUS 0x64
#define MOUSE_ABIT   0x02
#define MOUSE_BBIT   0x01
#define MOUSE_WRITE  0xD4
#define MOUSE_F_BIT  0x20
#define MOUSE_V_BIT  0x08

#define MOUSE_DEFAULT 0
#define MOUSE_SCROLLWHEEL 1
#define MOUSE_BUTTONS 2

static int8_t mouse_mode = MOUSE_DEFAULT;
void (*ps2_mouse_alternate)(void) = NULL;

static struct {
    struct spinlock lock;
    int locking;

    mouse_packet_t packets[MOUSE_PACKTES];
    int pos;
    int read_pos;
    int x;
    int y;
} mouse;

static int mouse_block_pid = -1;
static int mouse_block_fd = -1;

static void mouse_wait(uint8_t a_type) {
	uint32_t timeout = 100000;
	if (!a_type) {
		while (--timeout) {
			if ((inb(MOUSE_STATUS) & MOUSE_BBIT) == 1) {
				return;
			}
		}
		return;
	} else {
		while (--timeout) {
			if (!((inb(MOUSE_STATUS) & MOUSE_ABIT))) {
				return;
			}
		}
		return;
	}
}

static void mouse_write(uint8_t write) {
	mouse_wait(1);
	outb(MOUSE_STATUS, MOUSE_WRITE);
	mouse_wait(1);
	outb(MOUSE_PORT, write);
}

static uint8_t mouse_read(void) {
	mouse_wait(0);
	char t = inb(MOUSE_PORT);
	return t;
}

int
dev_mouse_open(struct inode *ip)
{
    return 0;
}

int
dev_mouse_read(struct inode *ip, char *dst, int n)
{
    int res;
    if (mouse.locking) {
        acquire(&mouse.lock);
    }

    if (mouse.read_pos == mouse.pos) {
        res = 0;
        goto ret;
    }

    mouse_packet_t* buf = (mouse_packet_t *)dst;
    for (int i=0; i<n; i++) {
        // buffer is empty
        if (mouse.read_pos == mouse.pos) {
            res = i;
            goto ret;
        }

        memcpy(buf++, &mouse.packets[mouse.read_pos], sizeof(mouse_packet_t));
        mouse.packets[mouse.read_pos].magic = 0;
        mouse.read_pos = (mouse.read_pos + 1) % MOUSE_PACKTES;
    }
    res = n;

ret:
    if (mouse.locking) {
        release(&mouse.lock);
    }
    return res;
}

int
dev_mouse_write(struct inode *ip, char *buf, int n)
{
    return -1;
}

int
dev_mouse_ioctl(struct inode* ip, int req, void* arg) {
    return -1;
}

int
dev_mouse_select_check(struct inode* ip) {
    int res;
    if (mouse.locking) {
        acquire(&mouse.lock);
    }

    if (mouse.read_pos == mouse.pos) {
        res = 0;
    } else {
        res = 1;
    }

    if (mouse.locking) {
        release(&mouse.lock);
    }
    return res;
}

int
dev_mouse_select_block(struct inode*ip, int pid, int fd) {
    if (mouse_block_pid == -1 && mouse_block_fd == -1) {
        mouse_block_pid = pid;
        mouse_block_fd = fd;
        return 1;
    }

    return 0;
}

void mouseintr() {
	uint8_t status = inb(MOUSE_STATUS);
	while ((status & MOUSE_BBIT) && (status & MOUSE_F_BIT)) {
		if (ps2_mouse_alternate) {
			ps2_mouse_alternate();
			break;
		}
		int8_t mouse_in = inb(MOUSE_PORT);
		switch (mouse_cycle) {
			case 0:
				mouse_byte[0] = mouse_in;
				if (!(mouse_in & MOUSE_V_BIT)) break;
				++mouse_cycle;
				break;
			case 1:
				mouse_byte[1] = mouse_in;
				++mouse_cycle;
				break;
			case 2:
				mouse_byte[2] = mouse_in;
				if (mouse_mode == MOUSE_SCROLLWHEEL || mouse_mode == MOUSE_BUTTONS) {
					++mouse_cycle;
					break;
				}
				goto finish_packet;
			case 3:
				mouse_byte[3] = mouse_in;
				goto finish_packet;
		}
		goto read_next;
finish_packet:
		mouse_cycle = 0;
		/* We now have a full mouse packet ready to use */
		mouse_packet_t packet = {0};
		packet.magic = MOUSE_MAGIC;
		int x = mouse_byte[1];
		int y = mouse_byte[2];
		if (x && mouse_byte[0] & (1 << 4)) {
			/* Sign bit */
			x = x - 0x100;
		}
		if (y && mouse_byte[0] & (1 << 5)) {
			/* Sign bit */
			y = y - 0x100;
		}
		if (mouse_byte[0] & (1 << 6) || mouse_byte[0] & (1 << 7)) {
			/* Overflow */
			x = 0;
			y = 0;
		}
		packet.x = x;
		packet.y = y;
		packet.buttons = 0;
		if (mouse_byte[0] & 0x01) {
			packet.buttons |= LEFT_CLICK;
		}
		if (mouse_byte[0] & 0x02) {
			packet.buttons |= RIGHT_CLICK;
		}
		if (mouse_byte[0] & 0x04) {
			packet.buttons |= MIDDLE_CLICK;
		}

		if (mouse_mode == MOUSE_SCROLLWHEEL && mouse_byte[3]) {
			if ((int8_t)mouse_byte[3] > 0) {
				packet.buttons |= MOUSE_SCROLL_DOWN;
			} else if ((int8_t)mouse_byte[3] < 0) {
				packet.buttons |= MOUSE_SCROLL_UP;
			}
		}

        if (mouse.locking) {
            acquire(&mouse.lock);
        }

        // buffer full
        if (((mouse.pos + 1) % MOUSE_PACKTES) != mouse.read_pos) {
            memcpy(&mouse.packets[mouse.pos], &packet, sizeof(mouse_packet_t));
            mouse.pos = (mouse.pos + 1) % MOUSE_PACKTES;
        }

        if (mouse.locking) {
            release(&mouse.lock);
        }

        /*
		mouse_packet_t bitbucket;
		while (pipe_size(mouse_pipe) > (int)(DISCARD_POINT * sizeof(packet))) {
			read_fs(mouse_pipe, 0, sizeof(packet), (uint8_t *)&bitbucket);
		}
		write_fs(mouse_pipe, 0, sizeof(packet), (uint8_t *)&packet);
        */
        if (mouse_block_pid != -1 && mouse_block_fd != -1) {
            unblock(mouse_block_pid, mouse_block_fd);
            mouse_block_pid = -1;
            mouse_block_fd = -1;
        }

read_next:
		break;
	}
}

void mouseinit(void) {
	uint8_t status, result;
    cprintf("[MOUSE] init\n");

    initlock(&mouse.lock, "mouse");
    mouse.locking = 1;

	while ((inb(0x64) & 1)) {
		inb(0x60);
	}

	mouse_wait(1);
	outb(MOUSE_STATUS, 0xA8);
	mouse_read();
	mouse_wait(1);
	outb(MOUSE_STATUS, 0x20);
	mouse_wait(0);
	status = inb(0x60) | 3;
	mouse_wait(1);
	outb(MOUSE_STATUS, 0x60);
	mouse_wait(1);
	outb(MOUSE_PORT, status);
	mouse_write(0xF6);
	mouse_read();
	mouse_write(0xF4);
	mouse_read();

    // sroll wheel
    mouse_write(0xF2);
    mouse_read();
    result = mouse_read();
    mouse_write(0xF3);
    mouse_read();
    mouse_write(200);
    mouse_read();
    mouse_write(0xF3);
    mouse_read();
    mouse_write(100);
    mouse_read();
    mouse_write(0xF3);
    mouse_read();
    mouse_write(80);
    mouse_read();
    mouse_write(0xF2);
    mouse_read();
    result = mouse_read();
    if (result == 3) {
        mouse_mode = MOUSE_SCROLLWHEEL;
    }


	/* keyboard scancode set */
	mouse_wait(1);
	outb(MOUSE_PORT, 0xF0);
	mouse_wait(1);
	outb(MOUSE_PORT, 0x02);
	mouse_wait(1);
	mouse_read();

    devsw[MOUSE].open = dev_mouse_open;
    devsw[MOUSE].write = dev_mouse_write;
    devsw[MOUSE].read = dev_mouse_read;
    devsw[MOUSE].ioctl = dev_mouse_ioctl;
    devsw[MOUSE].select_check = dev_mouse_select_check;
    devsw[MOUSE].select_block = dev_mouse_select_block;

    ioapicenable(IRQ_MOUSE, 0);

	uint8_t tmp = inb(0x61);
	outb(0x61, tmp | 0x80);
	outb(0x61, tmp & 0x7F);
	inb(MOUSE_PORT);

	while ((inb(0x64) & 1)) {
		inb(0x60);
	}
    cprintf("[MOUSE] finish \n");
}
