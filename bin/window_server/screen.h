#ifndef _WS_SCREEN_H_
#define _WS_SCREEN_H_

#include <stdint.h>

typedef struct screen_s {
    uint32_t fd;
    uint16_t width;
    uint16_t height;
    uint16_t depth;
	uint32_t size;
    unsigned char* buffer;
} SCREEN;

extern SCREEN* open_screen();
extern void close_screen();

#endif
