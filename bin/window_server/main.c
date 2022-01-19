#include <stdint.h>
#include <math.h>
#include <graphics.h>
#include "user.h"
#include "fcntl.h"
#include <png.h>
#include <jpeg.h>
#include <sdf.h>
#include <mouse.h>
#include <stdio.h>
#include "screen.h"

int main() {
    open_screen();
    blit_screen();

    do {

    } while (1);

    close_screen();
    exit();
}