CC = $(TOOLPREFIX)gcc
AS = $(TOOLPREFIX)gas
LD = $(TOOLPREFIX)ld

OBJCOPY = $(TOOLPREFIX)objcopy
OBJDUMP = $(TOOLPREFIX)objdump

CFLAGS = -fno-pic -static -fno-builtin -fno-strict-aliasing \
	-O2 -Wall -MD -ggdb -m32 -Werror -fno-omit-frame-pointer \
	-Wno-unused-variable -Wno-unused-function -Wno-address-of-packed-member

CFLAGS += -Iinclude -Werror=implicit-function-declaration
CFLAGS += $(shell $(CC) -fno-stack-protector -E -x c /dev/null >/dev/null 2>&1 && echo -fno-stack-protector)

ASFLAGS = -m32 -gdwarf-2 -Wa,-divide -Iinclude

# FreeBSD ld wants ``elf_i386_fbsd''
LDFLAGS += -m $(shell $(LD) -V | grep elf_i386 2>/dev/null | head -n 1)

# Disable PIE when possible (for Ubuntu 16.10 toolchain)
ifneq ($(shell $(CC) -dumpspecs 2>/dev/null | grep -e '[^f]no-pie'),)
CFLAGS += -fno-pie -no-pie
endif
ifneq ($(shell $(CC) -dumpspecs 2>/dev/null | grep -e '[^f]nopie'),)
CFLAGS += -fno-pie -nopie
endif

GCC_LIB := $(shell $(CC) $(CFLAGS) -print-libgcc-file-name)

bootblock.o: boot/bootasm.S boot/bootmain.c
	@mkdir -p build
	$(CC) $(CFLAGS) -fno-pic -nostdinc -I. -o build/bootasm.o -c boot/bootasm.S
	$(CC) $(CFLAGS) -fno-pic -nostdinc -I. -o build/bootmain.o -c boot/bootmain.c
	$(LD) $(LDFLAGS) -N -e start -Ttext 0x7C00 -o build/bootblock.o build/bootasm.o build/bootmain.o

echo:
	@echo $(CFLAGS)

.PHONY: clean
clean:
	rm -vrf ./build/*
