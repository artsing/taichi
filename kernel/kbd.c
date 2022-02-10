#include "types.h"
#include "x86.h"
#include "defs.h"
#include "param.h"
#include "spinlock.h"
#include "sleeplock.h"
#include "fs.h"
#include "file.h"
#include "kbd.h"

static struct {
    struct spinlock lock;
    int locking;

    char keys[KBD_KEYS];
    int pos;
    int read_pos;
} keyboard;

static int kbd_block_pid = -1;
static int kbd_block_fd = -1;

int
kbdgetc(void)
{
  static uint shift;
  static uchar *charcode[4] = {
    normalmap, shiftmap, ctlmap, ctlmap
  };
  uint st, data, c;

  st = inb(KBSTATP);
  if((st & KBS_DIB) == 0)
    return -1;
  data = inb(KBDATAP);

  if(data == 0xE0){
    shift |= E0ESC;
    return 0;
  } else if(data & 0x80){
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
    shift &= ~(shiftcode[data] | E0ESC);
    return 0;
  } else if(shift & E0ESC){
    // Last character was an E0 escape; or with 0x80
    data |= 0x80;
    shift &= ~E0ESC;
  }

  shift |= shiftcode[data];
  shift ^= togglecode[data];
  c = charcode[shift & (CTL | SHIFT)][data];
  if(shift & CAPSLOCK){
    if('a' <= c && c <= 'z')
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }

  if (keyboard.locking) {
      acquire(&keyboard.lock);
  }

    // buffer full
    if (((keyboard.pos + 1) % KBD_KEYS) != keyboard.read_pos) {
            keyboard.keys[keyboard.pos] = c;
            keyboard.pos = (keyboard.pos + 1) % KBD_KEYS;
    }

  if (keyboard.locking) {
      release(&keyboard.lock);
  }
  return c;
}

int
dev_keyboard_read(struct inode *ip, char *dst, int n)
{
    int res;
    if (keyboard.locking) {
        acquire(&keyboard.lock);
    }

    if (keyboard.read_pos == keyboard.pos) {
        res = 0;
        goto ret;
    }

    for (int i=0; i<n; i++) {
        // buffer is empty
        if (keyboard.read_pos == keyboard.pos) {
            res = i;
            goto ret;
        }

        *(dst++) = keyboard.keys[keyboard.read_pos];
        keyboard.keys[keyboard.read_pos] = 0;
        keyboard.read_pos = (keyboard.read_pos + 1) % KBD_KEYS;
    }
    res = n;

ret:
    if (keyboard.locking) {
        release(&keyboard.lock);
    }
    return res;
}

int
dev_keyboard_write(struct inode *ip, char *buf, int n)
{
    return -1;
}

int
dev_keyboard_ioctl(struct inode* ip, int req, void* arg) {
    return -1;
}

int
dev_keyboard_select_check(struct inode* ip) {
    int res;

    if (keyboard.locking) {
        acquire(&keyboard.lock);
    }

    if (keyboard.read_pos == keyboard.pos) {
        res = 0;
    } else {
        res = 1;
    }

    if (keyboard.locking) {
        release(&keyboard.lock);
    }
    return res;
}

int
dev_keyboard_select_block(struct inode*ip, int pid, int fd) {
    if (kbd_block_pid == -1 && kbd_block_fd == -1) {
        kbd_block_pid = pid;
        kbd_block_fd = fd;
        return 1;
    }
    return 0;
}

void
kbdintr(void)
{
    devsw[KEYBOARD].write = dev_keyboard_write;
    devsw[KEYBOARD].read = dev_keyboard_read;
    devsw[KEYBOARD].ioctl = dev_keyboard_ioctl;
    devsw[KEYBOARD].select_check = dev_keyboard_select_check;
    devsw[KEYBOARD].select_block = dev_keyboard_select_block;

    if (kbd_block_pid != -1 && kbd_block_fd != -1) {
        unblock(kbd_block_pid, kbd_block_fd);
        kbd_block_pid = -1;
        kbd_block_fd = -1;
    }

    consoleintr(kbdgetc);

}

void
kbdinit(void) {
    initlock(&keyboard.lock, "keyboard");
    keyboard.locking = 1;
}