#include "cursor.h"

void init_mouse_cursor8(unsigned char *mouse, char bc) {
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
    int x0 = 1024/2, y0 = 768/2;

    for (y = 0; y < 16; y++) {
        for (x = 0; x < 16; x++) {
            if (cursor[y][x] == '*') {
                mouse[(y0+y)* SCREEN_S(1024) + (x0+x)*SCREEN_B] = RGB_000000;
            }

            if (cursor[y][x] == 'O') {
                mouse[(y0+y)* SCREEN_S(1024) + (x0+x)*SCREEN_B] = RGB_FFFFFF;
            }

            if (cursor[y][x] == '.') {
                mouse[(y0+y)* SCREEN_S(1024) + (x0+x)*SCREEN_B] = bc;
            }
        }
    }
}