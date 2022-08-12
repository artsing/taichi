all: test.c
	gcc test.c -lm -g -m32


fs.img:
	dd if=/dev/zero bs=1k count=1024 of=fs.img
	mkfs.ext2 -b 1024 fs.img

fs.img2:
	dd if=/dev/zero bs=1k count=4096 of=fs.img
	mkfs.ext2 -b 1024 fs.img

build/hda.img: boot/bootx64.efi
	@mkdir -p build/mnt
	sudo dd if=/dev/zero of=build/hda.img bs=1 count=2M
	sudo mkfs -t vfat build/hda.img
	sudo losetup /dev/loop20 build/hda.img
	sudo mount /dev/loop20 build/mnt
	sudo cp -vrf boot/bootx64.efi build/mnt
	sudo umount build/mnt
	sudo losetup -d /dev/loop20


mount: kernel
	sudo mount -o loop fs.img mnt
	sudo mkdir -p mnt/boot
	sudo cp kernel mnt/boot

umount:
	sudo umount mnt

clean:
	rm a.out
	rm fs.img
