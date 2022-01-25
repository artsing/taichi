#ifndef _TIME_H_
#define _TIME_H_
#include <stdint.h>

struct timeval {
    time_t tv_sec;
    suseconds_t tv_usec;
};

#endif // _TIME_H_
