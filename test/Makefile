all: test.c
	gcc test.c -lm -g


fs.img:
	dd if=/dev/zero bs=1k count=1024 of=fs.img
	mkfs.ext2 -b 1024 fs.img

mount: kernel
	sudo mount -o loop fs.img mnt
	sudo mkdir -p mnt/boot
	sudo cp kernel mnt/boot

umount:
	sudo umount mnt

clean:
	rm a.out
	rm fs.img