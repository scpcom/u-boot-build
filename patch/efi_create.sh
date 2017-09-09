#!/bin/sh

gcc -Wp,-MD,lib/efi_selftest/.efi_selftest.o.d -nostdinc -isystem /usr/lib/gcc/x86_64-linux-gnu/6/include -Iinclude   -I./arch/x86/include -include ./include/linux/kconfig.h -D__KERNEL__ -D__UBOOT__ -Wall -Wstrict-prototypes -Wno-format-security -fno-builtin -ffreestanding -Os -fno-stack-protector -fno-delete-null-pointer-checks -g -fstack-usage -Wno-format-nonliteral -Werror=date-time -fno-strict-aliasing -fomit-frame-pointer -fno-toplevel-reorder -fno-dwarf2-cfi-asm -march=i386 -m32 -D__I386__ -ffunction-sections -fvisibility=hidden -pipe -no-pie -fno-PIE -fshort-wchar -mno-red-zone    -D"KBUILD_STR(s)=#s" -D"KBUILD_BASENAME=KBUILD_STR(efi_selftest)"  -D"KBUILD_MODNAME=KBUILD_STR(efi_selftest)" -c -o lib/efi_selftest/efi_selftest.o lib/efi_selftest/efi_selftest.c

gcc -Wp,-MD,lib/efi_selftest/.efi_conout.o.d  -nostdinc -isystem /usr/lib/gcc/x86_64-linux-gnu/6/include -Iinclude   -I./arch/x86/include -include ./include/linux/kconfig.h -D__KERNEL__ -D__UBOOT__ -Wall -Wstrict-prototypes -Wno-format-security -fno-builtin -ffreestanding -Os -fno-stack-protector -fno-delete-null-pointer-checks -g -fstack-usage -Wno-format-nonliteral -Werror=date-time -fno-strict-aliasing -fomit-frame-pointer -fno-toplevel-reorder -fno-dwarf2-cfi-asm -march=i386 -m32 -D__I386__ -ffunction-sections -fvisibility=hidden -pipe -no-pie -fno-PIE -fshort-wchar -mno-red-zone    -D"KBUILD_STR(s)=#s" -D"KBUILD_BASENAME=KBUILD_STR(efi_conout)"  -D"KBUILD_MODNAME=KBUILD_STR(efi_conout)" -c -o lib/efi_selftest/efi_conout.o lib/efi_selftest/efi_conout.c
 
gcc -Wp,-MD,lib/efi_selftest/.efi_selftest_events.o.d  -nostdinc -isystem /usr/lib/gcc/x86_64-linux-gnu/6/include -Iinclude   -I./arch/x86/include -include ./include/linux/kconfig.h -D__KERNEL__ -D__UBOOT__ -Wall -Wstrict-prototypes -Wno-format-security -fno-builtin -ffreestanding -Os -fno-stack-protector -fno-delete-null-pointer-checks -g -fstack-usage -Wno-format-nonliteral -Werror=date-time -fno-strict-aliasing -fomit-frame-pointer -fno-toplevel-reorder -fno-dwarf2-cfi-asm -march=i386 -m32 -D__I386__ -ffunction-sections -fvisibility=hidden -pipe -no-pie -fno-PIE -fshort-wchar -mno-red-zone    -D"KBUILD_STR(s)=#s" -D"KBUILD_BASENAME=KBUILD_STR(efi_selftest_events)"  -D"KBUILD_MODNAME=KBUILD_STR(efi_selftest_events)" -c -o lib/efi_selftest/efi_selftest_events.o lib/efi_selftest/efi_selftest_events.c

ld.bfd \
-nostdlib \
-znocombreloc \
-T ./arch/x86/lib/elf_ia32_efi.lds \
-static \
-Bsymbolic \
-e efi_main \
lib/efi_selftest/efi_conout.o \
lib/efi_selftest/efi_selftest.o \
lib/efi_selftest/efi_selftest_events.o \
-Map lib/efi_selftest/efi_selftest.map \
-o lib/efi_selftest/efi_selftest.tmp

ld -m elf_i386 -q -S \
-static  -T arch/x86/lib/elf_ia32_efi.lds \
-e efi_main \
lib/efi_selftest/efi_conout.o \
lib/efi_selftest/efi_selftest.o \
lib/efi_selftest/efi_selftest_events.o \
-o lib/efi_selftest/efi_selftest.tmp \
-Map lib/efi_selftest/efi_selftest.map

vi lib/efi_selftest/efi_selftest.map

../ipxe/src/util/elf2efi32 \
--subsystem=10 \
lib/efi_selftest/efi_selftest.tmp \
lib/efi_selftest/efi_selftest.efi

sudo mount ../img -o loop,offset=1048576 /mnt
sudo cp lib/efi_selftest/efi_selftest.efi /mnt
sync
sudo umount /mnt

cd ..
make luv
