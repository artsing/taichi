#include "types.h"
#include "user.h"
#include "fcntl.h"

#define N 7
char* name[N] = {
    "resolution_x",
    "resolution_y",
    "resolution_b",
    "resolution_s",
    "resolution_addr",
    "resolution_size",
};

int
main(int argc, char* argv[])
{
    int fd, err;
    char* arg;

    fd = open("/dev/fb0", O_RDWR);
    if (fd < 0) {
        printf(2, "open /dev/fb0 failed.\n");
        exit();
    }

    for (int i=1; i<N; i++) {
        err = ioctl(fd, i, &arg);
        if (err < 0) {
            printf(2, "ioctl /dev/fb0 failed.\n");
        } else {
            if (i == 5) {
                printf(1, "%s = %x. \n", name[i-1], arg);
                continue;
            }
            printf(1, "%s = %d.\n", name[i-1], err);
        }
    }

    close(fd);
    exit();
}
