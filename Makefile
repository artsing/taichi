ifndef QEMU
QEMU = $(shell if which qemu > /dev/null; \
	then echo qemu; exit; \
	elif which qemu-system-i386 > /dev/null; \
	then echo qemu-system-i386; exit; \
	elif which qemu-system-x86_64 > /dev/null; \
	then echo qemu-system-x86_64; exit; \
	else \
	qemu=/Applications/Q.app/Contents/MacOS/i386-softmmu.app/Contents/MacOS/i386-softmmu; \
	if test -x $$qemu; then echo $$qemu; exit; fi; fi; \
	echo "***" 1>&2; \
	echo "*** Error: Couldn't find a working QEMU executable." 1>&2; \
	echo "*** Is the directory containing the qemu binary in your PATH" 1>&2; \
	echo "*** or have you tried setting the QEMU variable in Makefile?" 1>&2; \
	echo "***" 1>&2; exit 1)
endif

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

bootblock: boot/bootasm.S boot/bootmain.c
	@mkdir -p build
	$(CC) $(CFLAGS) -fno-pic -nostdinc -I. -o build/bootasm.o -c boot/bootasm.S
	$(CC) $(CFLAGS) -fno-pic -O -nostdinc -I. -o build/bootmain.o -c boot/bootmain.c
	$(LD) $(LDFLAGS) -N -e start -Ttext 0x7C00 -o build/bootblock.o build/bootasm.o build/bootmain.o
	$(OBJDUMP) -S build/bootblock.o > build/bootblock.asm
	$(OBJCOPY) -S -O binary -j .text build/bootblock.o build/bootblock
	./tools/sign.pl build/bootblock


xv6.img: build/bootblock test/kernel
	dd if=/dev/zero of=$@ count=10000
	dd if=$< of=$@ conv=notrunc
	dd if=test/kernel of=$@ seek=1 conv=notrunc

ifndef CPUS
CPUS := 2
endif

QEMUOPTS = -drive file=build/fs.img,index=1,media=disk,format=raw -drive file=build/xv6.img,index=0,media=disk,format=raw -smp $(CPUS) -m 1024 $(QEMUEXTRA)

QEMUNET = -netdev user,id=n1,hostfwd=udp::10007-:7,hostfwd=tcp::10007-:7 -device e1000,netdev=n1 -object filter-dump,id=f1,netdev=n1,file=$(TOOLS)/n1.pcap -netdev tap,id=n2,ifname=tap0 -device e1000,netdev=n2 -object filter-dump,id=f2,netdev=n2,file=$(TOOLS)/n2.pcap

qemu: build/fs.img build/xv6.img
	$(QEMU) -nographic $(QEMUOPTS)

echo:
	@echo $(CFLAGS)

git-push:
	git push -u origin main

.PHONY: clean
clean:
	rm -vrf ./build/*
