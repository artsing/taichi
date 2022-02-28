// init: The initial user-level program

#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

char *argv[] = { "sh", 0 };

int
main(void)
{
    int pid, wpid;

    if (open("/dev/console", O_RDWR) < 0) {
        mknod("/dev/console", 1, 1);
        open("/dev/console", O_RDWR);
    }
    dup(0);  // stdout
    dup(0);  // stderr

    if (open("/dev/fb0", O_RDWR) < 0) {
        mknod("/dev/fb0", 2, 1);
    }

    if (open("/dev/mouse", O_RDWR) < 0) {
        mknod("/dev/mouse", 3, 1);
    }

    if (open("/dev/kbd", O_RDWR) < 0) {
        mknod("/dev/kbd", 4, 1);
    }

    if (open("/dev/ptmx", O_RDWR) < 0) {
        int r = mknod("/dev/ptmx", 5, 1);
        printf(1, "mknod /dev/ptmx r = %d\n", r);
    }

    pid = fork();
    if (pid == 0) {
        exec("/bin/ws", argv);
        exit();
    }

    for(;;){
        printf(1, "init: starting sh\n");
        pid = fork();

        if(pid < 0){
            printf(1, "init: fork failed\n");
            exit();
        }

        if(pid == 0){
            exec("/bin/sh", argv);
            printf(1, "init: exec sh failed\n");
            exit();
        }

        while((wpid=wait()) >= 0 && wpid != pid)
        printf(1, "zombie!\n");
    }
}
