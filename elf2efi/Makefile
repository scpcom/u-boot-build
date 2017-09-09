


all:
	make bin32
	make bin64

bin32:
	gcc elf2efi.c \
	-D EFI_TARGET32 \
	-I. \
	-o elf2efi32

bin64:
	gcc elf2efi.c \
	-D EFI_TARGET64 \
	-I. \
	-o elf2efi64
