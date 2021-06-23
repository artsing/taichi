#include "types.h"
#include "user.h"
#include "fcntl.h"

int
main(int argc, char* argv[])
{
    int fd, err;
    char buf[100];
    void* arg = (void*)(buf);

    fd = open("/dev/fb0", O_RDWR);
    if (fd < 0) {
        printf(2, "open /dev/fb0 failed.\n");
        exit();
    }

    for (int i=1; i<5; i++) {
        err = ioctl(fd, i, arg);
        if (err < 0) {
            printf(2, "ioctl /dev/fb0 failed.\n");
        } else {
            printf(1, "ioctl %d.\n", err);
        }
    }

    close(fd);
    exit();
}
