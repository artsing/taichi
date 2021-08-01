#ifndef _MOUSE_H_
#define _MOUSE_H_

typedef enum {
	LEFT_CLICK   = 0x01,
	RIGHT_CLICK  = 0x02,
	MIDDLE_CLICK = 0x04,

	MOUSE_SCROLL_UP = 0x10,
	MOUSE_SCROLL_DOWN = 0x20,
} mouse_click_t;

typedef struct {
	uint32_t magic;
	int32_t x;
	int32_t y;
	mouse_click_t buttons;
} mouse_packet_t;

#define MOUSE_MAGIC 0xFEED1234

#endif
