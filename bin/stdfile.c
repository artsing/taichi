#include <stdint.h>
#include <fcntl.h>
#include <stdio.h>
#include <user.h>

int main() {
    FILE* f;
    int c;

    f = fopen("README.org", O_RDONLY);
    if (f == NULL) {
        return -1;
    }

    for (int i=0; i<100; i++) {
        c = fgetc(f);
        if (c == EOF) {
            break;
        }
        printf(1, "%c", c);
    }

    fclose(f);
    exit();
}
