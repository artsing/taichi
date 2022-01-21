#include "cursor.h"

void init_mouse_cursor8(unsigned char *mouse, int bc) {
    static char cursor[16][16] = {
        "**************..",
        "*OOOOOOOOOOO*...",
        "*OOOOOOOOOO*....",
        "*OOOOOOOOO*.....",
        "*OOOOOOOO*......",
        "*OOOOOOO*.......",
        "*OOOOOOO*.......",
        "*OOOOOOOO*......",
        "*OOOO**OOO*.....",
        "*OOO*..*OOO*....",
        "*OO*....*OOO*...",
        "*O*......*OOO*..",
        "**........*OOO*.",
        "*..........*OOO*",
        "............*OO*",
        ".............***"
    };

    int x, y;

    for (y = 0; y < 16; y++) {
        for (x = 0; x < 16; x++) {
            if (cursor[y][x] == '*') {
                SCREEN_POINT(mouse, 16, x, y) = RGB_000000;
            }

            if (cursor[y][x] == 'O') {
                SCREEN_POINT(mouse, 16, x, y) = RGB_FFFFFF;
            }

            if (cursor[y][x] == '.') {
                SCREEN_POINT(mouse, 16, x, y) = bc;
            }
        }
    }
}