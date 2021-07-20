BUILD = build
BUILD_KERNEL = $(BUILD)/kernel
BUILD_LIB = $(BUILD)/lib
BUILD_BIN = $(BUILD)/bin

BIN = bin
LIB = lib
KERNEL = kernel
NET = net
TOOLS = tools
INCLUDE = include

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

OBJS = \
	$(BUILD_KERNEL)/bio.o\
	$(BUILD_KERNEL)/console.o\
	$(BUILD_KERNEL)/exec.o\
	$(BUILD_KERNEL)/file.o\
	$(BUILD_KERNEL)/fs.o\
	$(BUILD_KERNEL)/ide.o\
	$(BUILD_KERNEL)/ioapic.o\
	$(BUILD_KERNEL)/kalloc.o\
	$(BUILD_KERNEL)/kbd.o\
	$(BUILD_KERNEL)/lapic.o\
	$(BUILD_KERNEL)/log.o\
	$(BUILD_KERNEL)/main.o\
	$(BUILD_KERNEL)/mp.o\
	$(BUILD_KERNEL)/pci.o\
	$(BUILD_KERNEL)/picirq.o\
	$(BUILD_KERNEL)/pipe.o\
	$(BUILD_KERNEL)/printfmt.o\
	$(BUILD_KERNEL)/proc.o\
	$(BUILD_KERNEL)/sleeplock.o\
	$(BUILD_KERNEL)/spinlock.o\
	$(BUILD_KERNEL)/string.o\
	$(BUILD_KERNEL)/swtch.o\
	$(BUILD_KERNEL)/syscall.o\
	$(BUILD_KERNEL)/sysfile.o\
	$(BUILD_KERNEL)/sysproc.o\
	$(BUILD_KERNEL)/trapasm.o\
	$(BUILD_KERNEL)/trap.o\
	$(BUILD_KERNEL)/uart.o\
	$(BUILD_KERNEL)/vectors.o\
	$(BUILD_KERNEL)/vm.o\

NET_OBJS = \
	$(BUILD_KERNEL)/arp.o\
	$(BUILD_KERNEL)/common.o\
	$(BUILD_KERNEL)/e1000.o\
	$(BUILD_KERNEL)/ethernet.o\
	$(BUILD_KERNEL)/icmp.o\
	$(BUILD_KERNEL)/ip.o\
	$(BUILD_KERNEL)/mt19937ar.o\
	$(BUILD_KERNEL)/net.o\
	$(BUILD_KERNEL)/socket.o\
	$(BUILD_KERNEL)/sysnet.o\
	$(BUILD_KERNEL)/syssocket.o\
	$(BUILD_KERNEL)/tcp.o\
	$(BUILD_KERNEL)/udp.o\

VIDEO_OBJS = \
	$(BUILD_KERNEL)/lbfvideo.o\

OBJS += $(NET_OBJS)

OBJS += $(VIDEO_OBJS)


CC = $(TOOLPREFIX)gcc
AS = $(TOOLPREFIX)gas
LD = $(TOOLPREFIX)ld
OBJCOPY = $(TOOLPREFIX)objcopy
OBJDUMP = $(TOOLPREFIX)objdump
CFLAGS = -fno-pic -static -fno-builtin -fno-strict-aliasing -O2 -Wall -MD -ggdb -m32 -Werror -fno-omit-frame-pointer -Wno-unused-variable -Wno-unused-function -Wno-address-of-packed-member
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


all: qemu-nox

$(BUILD)/xv6.img: $(BUILD_KERNEL)/bootblock $(BUILD_KERNEL)/kernel
	@mkdir -p build build/kernel
	dd if=/dev/zero of=$@ count=10000
	dd if=$< of=$@ conv=notrunc
	dd if=$(BUILD_KERNEL)/kernel of=$@ seek=1 conv=notrunc

$(BUILD)/xv6memfs.img: $(BUILD_KERNEL)/bootblock $(BUILD_KERNEL)/kernelmemfs
	@mkdir -p build build/kernel
	dd if=/dev/zero of=$(BUILD)/xv6memfs.img count=10000
	dd if=$(BUILD_KERNEL)/bootblock of=$(BUILD)/xv6memfs.img conv=notrunc
	dd if=$(BUILD_KERNEL)/kernelmemfs of=$(BUILD)/xv6memfs.img seek=1 conv=notrunc

$(BUILD_KERNEL)/%.o: $(KERNEL)/%.c
	@mkdir -p build/kernel
	$(CC) $(CFLAGS) -c -o $@ $<

$(BUILD_KERNEL)/%.o: $(NET)/%.c
	@mkdir -p build/kernel
	$(CC) $(CFLAGS) -c -o $@ $<

$(BUILD_KERNEL)/%.o: $(KERNEL)/%.S
	@mkdir -p build/kernel
	$(CC) $(ASFLAGS) -c -o $@ $<

# userspace object files
$(BUILD_BIN)/%.o: $(BIN)/%.c
	@mkdir -p build build/bin
	$(CC) $(CFLAGS) -c -o $@ $<

$(BUILD_BIN)/_uthread: $(BUILD_BIN)/uthread.o $(BUILD_BIN)/uthread_switch.o
	$(LD) $(LDFLAGS) -N -e main -Ttext 0 -o $@ $^ $(ULIB)
	$(OBJDUMP) -S $@ > $(BUILD_BIN)/uthread.asm

$(BUILD_KERNEL)/bootblock: $(KERNEL)/bootasm.S $(KERNEL)/bootmain.c
	@mkdir -p build/kernel
	$(CC) $(CFLAGS) -fno-pic -O -nostdinc -I. -o $(BUILD_KERNEL)/bootmain.o -c $(KERNEL)/bootmain.c
	$(CC) $(CFLAGS) -fno-pic -nostdinc -I. -o $(BUILD_KERNEL)/bootasm.o -c $(KERNEL)/bootasm.S
	$(LD) $(LDFLAGS) -N -e start -Ttext 0x7C00 -o $(BUILD_KERNEL)/bootblock.o $(BUILD_KERNEL)/bootasm.o $(BUILD_KERNEL)/bootmain.o
	$(OBJDUMP) -S $(BUILD_KERNEL)/bootblock.o > $(BUILD_KERNEL)/bootblock.asm
	$(OBJCOPY) -S -O binary -j .text $(BUILD_KERNEL)/bootblock.o $(BUILD_KERNEL)/bootblock
	./tools/sign.pl $(BUILD_KERNEL)/bootblock

$(BUILD_KERNEL)/entryother: $(KERNEL)/entryother.S
	@mkdir -p build/kernel
	$(CC) $(CFLAGS) -fno-pic -nostdinc -I. -o $(BUILD_KERNEL)/entryother.o -c $(KERNEL)/entryother.S
	$(LD) $(LDFLAGS) -N -e start -Ttext 0x7000 -o $(BUILD_KERNEL)/bootblockother.o $(BUILD_KERNEL)/entryother.o
	$(OBJCOPY) -S -O binary -j .text $(BUILD_KERNEL)/bootblockother.o $(BUILD_KERNEL)/entryother
	$(OBJDUMP) -S $(BUILD_KERNEL)/bootblockother.o > $(BUILD_KERNEL)/entryother.asm

$(BUILD_KERNEL)/initcode: $(KERNEL)/initcode.S
	@mkdir -p build/kernel
	$(CC) $(CFLAGS) -nostdinc -I. -o $(BUILD_KERNEL)/initcode.o -c $(KERNEL)/initcode.S
	$(LD) $(LDFLAGS) -N -e start -Ttext 0 -o $(BUILD_KERNEL)/initcode.out $(BUILD_KERNEL)/initcode.o
	$(OBJCOPY) -S -O binary $(BUILD_KERNEL)/initcode.out $(BUILD_KERNEL)/initcode
	$(OBJDUMP) -S $(BUILD_KERNEL)/initcode.o > $(BUILD_KERNEL)/initcode.asm

$(BUILD_KERNEL)/kernel: $(OBJS) $(BUILD_KERNEL)/entry.o $(BUILD_KERNEL)/entryother $(BUILD_KERNEL)/initcode $(KERNEL)/kernel.ld
	@mkdir -p build/kernel
	$(LD) $(LDFLAGS) -T $(KERNEL)/kernel.ld -o $(BUILD_KERNEL)/kernel $(BUILD_KERNEL)/entry.o $(OBJS) $(GCC_LIB) -b binary build/kernel/initcode build/kernel/entryother
	$(OBJDUMP) -S $(BUILD_KERNEL)/kernel > $(BUILD_KERNEL)/kernel.asm
	$(OBJDUMP) -t $(BUILD_KERNEL)/kernel | sed '1,/SYMBOL TABLE/d; s/ .* / /; /^$$/d' > $(BUILD_KERNEL)/kernel.sym

# kernelmemfs is a copy of kernel that maintains the
# disk image in memory instead of writing to a disk.
# This is not so useful for testing persistent storage or
# exploring disk buffering implementations, but it is
# great for testing the kernel on real hardware without
# needing a scratch disk.
MEMFSOBJS = $(filter-out ide.o,$(OBJS)) memide.o
kernelmemfs: $(MEMFSOBJS) entry.o entryother initcode kernel.ld fs.img
	$(LD) $(LDFLAGS) -T kernel.ld -o kernelmemfs entry.o  $(MEMFSOBJS) -b binary initcode entryother fs.img
	$(OBJDUMP) -S kernelmemfs > kernelmemfs.asm
	$(OBJDUMP) -t kernelmemfs | sed '1,/SYMBOL TABLE/d; s/ .* / /; /^$$/d' > kernelmemfs.sym

$(KERNEL)/vectors.S: $(TOOLS)/vectors.pl
	perl $(TOOLS)/vectors.pl > $(KERNEL)/vectors.S

ULIB = $(BUILD_LIB)/ulib.o $(BUILD_LIB)/usys.o $(BUILD_LIB)/printf.o $(BUILD_LIB)/umalloc.o \
       $(BUILD_LIB)/math.o $(BUILD_LIB)/inflate.o $(BUILD_LIB)/graphics.o $(BUILD_LIB)/png.o

$(BUILD_LIB)/%.o: $(LIB)/%.c
	@mkdir -p build build/lib
	$(CC) $(CFLAGS) -c -o $@ $<

$(BUILD_LIB)/%.o: $(LIB)/%.S
	@mkdir -p build build/lib
	$(CC) $(ASFLAGS) -c -o $@ $<

$(BUILD_BIN)/%.o: $(BIN)/%.S
	@mkdir -p build/bin
	$(CC) $(ASFLAGS) -c -o $@ $<

$(BUILD_BIN)/_%: $(BUILD_BIN)/%.o $(ULIB)
	@mkdir -p build build/bin
	$(LD) $(LDFLAGS) -N -e main -Ttext 0 -o $@ $^
	$(OBJDUMP) -S $@ > $(BUILD_BIN)/$*.asm
	$(OBJDUMP) -t $@ | sed '1,/SYMBOL TABLE/d; s/ .* / /; /^$$/d' > $(BUILD_BIN)/$*.sym

$(BUILD_BIN)/_forktest: $(BUILD_BIN)/forktest.o $(ULIB)
	# forktest has less library code linked in - needs to be small
	# in order to be able to max out the proc table.
	@mkdir -p build build/bin
	$(LD) $(LDFLAGS) -N -e main -Ttext 0 -o $@ $(BUILD_BIN)/forktest.o $(BUILD_LIB)/ulib.o $(BUILD_LIB)/usys.o
	$(OBJDUMP) -S $@ > $(BUILD_BIN)/forktest.asm

$(BUILD)/mkfs: $(TOOLS)/mkfs.c $(INCLUDE)/fs.h
	@mkdir -p build
	gcc -Werror -Wall -DBUILD_MKFS -o $(BUILD)/mkfs $(TOOLS)/mkfs.c

# Prevent deletion of intermediate files, e.g. cat.o, after first build, so
# that disk image changes after first build are persistent until clean.  More
# details:
# http://www.gnu.org/software/make/manual/html_node/Chained-Rules.html
.PRECIOUS: $(BUILD_BIN)/%.o

UPROGS=\
	$(BUILD_BIN)/_cat\
	$(BUILD_BIN)/_echo\
	$(BUILD_BIN)/_forktest\
	$(BUILD_BIN)/_grep\
	$(BUILD_BIN)/_init\
	$(BUILD_BIN)/_kill\
	$(BUILD_BIN)/_ln\
	$(BUILD_BIN)/_ls\
	$(BUILD_BIN)/_mkdir\
	$(BUILD_BIN)/_rm\
	$(BUILD_BIN)/_sh\
	$(BUILD_BIN)/_stressfs\
	$(BUILD_BIN)/_wc\
	$(BUILD_BIN)/_uthread\
	$(BUILD_BIN)/_usertests\
	$(BUILD_BIN)/_zombie\
	$(BUILD_BIN)/_video\
	
NET_PROGS=\
	  $(BUILD_BIN)/_ifconfig\
	  $(BUILD_BIN)/_tcpechoserver\
	  $(BUILD_BIN)/_udpechoserver\

UPROGS += $(NET_PROGS)

$(BUILD)/fs.img: $(BUILD)/mkfs README.org $(UPROGS)
	./$(BUILD)/mkfs $(BUILD)/fs.img README.org $(UPROGS)

-include *.d

clean:
	rm -vrf build

# run in emulators
# try to generate a unique GDB port
GDBPORT = $(shell expr `id -u` % 5000 + 25000)
# QEMU's gdb stub command line changed in 0.11
QEMUGDB = $(shell if $(QEMU) -help | grep -q '^-gdb'; \
	then echo "-gdb tcp::$(GDBPORT)"; \
	else echo "-s -p $(GDBPORT)"; fi)
ifndef CPUS
CPUS := 2
endif

QEMUOPTS = -drive file=$(BUILD)/fs.img,index=1,media=disk,format=raw -drive file=$(BUILD)/xv6.img,index=0,media=disk,format=raw -smp $(CPUS) -m 1024 $(QEMUEXTRA) $(QEMUNET)

QEMUNET = -netdev user,id=n1,hostfwd=udp::10007-:7,hostfwd=tcp::10007-:7 -device e1000,netdev=n1 -object filter-dump,id=f1,netdev=n1,file=$(TOOLS)/n1.pcap -netdev tap,id=n2,ifname=tap0 -device e1000,netdev=n2 -object filter-dump,id=f2,netdev=n2,file=$(TOOLS)/n2.pcap

qemu: $(BUILD)/fs.img $(BUILD)/xv6.img
	$(QEMU) -serial mon:stdio $(QEMUOPTS)

qemu-memfs: xv6memfs.img
	$(QEMU) -drive file=xv6memfs.img,index=0,media=disk,format=raw -smp $(CPUS) -m 256

qemu-nox: $(BUILD)/fs.img $(BUILD)/xv6.img
	$(QEMU) -nographic $(QEMUOPTS)

.gdbinit: .gdbinit.tmpl
	sed "s/localhost:1234/localhost:$(GDBPORT)/" < $^ > $@

qemu-gdb: $(BUILD)/fs.img $(BUILD)/xv6.img .gdbinit
	@echo "*** Now run 'gdb'." 1>&2
	$(QEMU) -serial mon:stdio $(QEMUOPTS) -S $(QEMUGDB)

qemu-nox-gdb: $(BUILD)/fs.img $(BUILD)/xv6.img .gdbinit
	@echo "*** Now run 'gdb'." 1>&2
	$(QEMU) -nographic $(QEMUOPTS) -S $(QEMUGDB)

run: $(BUILD)/xv6.img $(BUILD)/fs.img
	ip tuntap add mode tap name tap0
	ip addr add 172.16.100.1/24 dev tap0
	ip link set tap0 up
	$(QEMU) -nographic $(QEMUOPTS)

clear: 
	ip tuntap del mode tap name tap0

.PHONY: clean clear run
