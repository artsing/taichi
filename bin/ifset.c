#include "types.h"
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
    if (argc != 4) {
        exit();
    }
    ifset(argv[1], argv[2], argv[3]);
    exit();
}
