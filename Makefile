BUILD_DIR=./build
LIB=-I include/
#CFLAGS=-fno-builtin -fno-stack-protector -O2
CFLAGS=-fno-builtin -fno-stack-protector -O2


.PHONY: hash

all:img
img:asm hash kernelSize
	# cp -f hd60M.img.bak hd60M.img
	dd if=$(BUILD_DIR)/mbr.bin of=hd60M.img count=1 bs=512 conv=notrunc
	dd if=$(BUILD_DIR)/loader.bin of=hd60M.img bs=512 count=5 seek=1 conv=notrunc
	dd if=$(BUILD_DIR)/kernel.bin of=hd60M.img bs=512 count=200 seek=6 conv=notrunc
	dd if=hash of=hd60M.img bs=512 count=1 seek=23 conv=notrunc
	dd if=kernelSize of=hd60M.img bs=512 count=1 seek=24 conv=notrunc

asm:
	nasm -I include/ -o $(BUILD_DIR)/mbr.bin mbr.S
	nasm -I include/ -f elf32 -o $(BUILD_DIR)/print.o lib/print.S
	# kernel
	gcc  -I lib/ -m32 -c -o $(BUILD_DIR)/main.o kernel/main.c
	ld -m elf_i386  $(BUILD_DIR)/main.o $(BUILD_DIR)/print.o -Ttext 0xc0001000 -o $(BUILD_DIR)/main.bin
	objcopy -O binary $(BUILD_DIR)/main.bin $(BUILD_DIR)/kernel.bin
	# loader
	nasm -f elf32   -I include/ -o $(BUILD_DIR)/loader.elf loader.S
	# decrypt
	gcc $(CFLAGS) -m32 -c lib/decrypt.c -o $(BUILD_DIR)/decrypt.o
	# link && final
	ld -m elf_i386 -T linkerScript $(BUILD_DIR)/loader.elf $(BUILD_DIR)/decrypt.o -o $(BUILD_DIR)/loader.tmp
	objcopy -O binary $(BUILD_DIR)/loader.tmp $(BUILD_DIR)/loader.bin

clean:
	rm $(BUILD_DIR)/*.*
hash:
	gcc genhash.c -o genhash
	./genhash > hash
kernelSize:
	gcc genKernelSize.c -o genKernelSize
	./genKernelSize > kernelSize
