#include <string.h>
#include <stdint.h>
#include <user.h>

char * strdup(const char * s) {
	size_t l = strlen(s);
	return memcpy(malloc(l+1), (void*)s, l+1);
}
