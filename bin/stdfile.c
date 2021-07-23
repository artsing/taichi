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

    fseek(f, 0, SEEK_END);
    int size = ftell(f);
    fseek(f, 0, SEEK_SET);

    printf(1, "file size = %d \n", size);

    c =fgetc(f);
    printf(1, "%c", c);


    char ptr[11];
    ptr[10] = '\0';
    fread(ptr, 1, 10, f);
    printf(1, "read 10 >>%s<< ", ptr);

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
