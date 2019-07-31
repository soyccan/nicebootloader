BUILD_DIR=./build
LIB=-I include/
CFLAGS=-fno-builtin -fno-stack-protector -O2

.PHONY: hash

all:img
img:asm hash
	cp -f hd60M.img.bak hd60M.img
	dd if=$(BUILD_DIR)/mbr.bin of=hd60M.img count=1 bs=512 conv=notrunc
	dd if=$(BUILD_DIR)/loader.bin of=hd60M.img bs=512 count=4 seek=1 conv=notrunc
	dd if=$(BUILD_DIR)/kernel.bin of=hd60M.img bs=512 count=200 seek=5 conv=notrunc
	dd if=hash of=hd60M.img bs=512 count=6 seek=22 conv=notrunc

asm:
	nasm -I include/ -o $(BUILD_DIR)/mbr.bin mbr.S
	nasm -I include/ -o $(BUILD_DIR)/loader.bin loader.S
	nasm -I include/ -f elf32 -o $(BUILD_DIR)/print.o lib/print.S
	gcc  -I lib/ -m32 -c -o $(BUILD_DIR)/main.o kernel/main.c
	ld -m elf_i386  $(BUILD_DIR)/main.o $(BUILD_DIR)/print.o -Ttext 0xc0001000 -o $(BUILD_DIR)/main.bin
	objcopy -O binary $(BUILD_DIR)/main.bin $(BUILD_DIR)/kernel.bin
clean:
	rm $(BUILD_DIR)/*.*
hash:
	gcc genhash.c -o genhash
	./genhash > hash
