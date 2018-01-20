#!/bin/sh
git am ../patch/0001-ubifs-avoid-possible-NULL-dereference.patch

# git am ../patch/0001-Test-vexpress-only.patch
git am ../patch/0001-vexpress_ca15_tc2_defconfig-build-EFI.patch

# Fix building u-boot.rom for qemu-x86_64_defconfig
git am ../patch/0001-spl-u-boot-spl-nodtb.bin-remove-.got-and-.got.plt-se.patch

git am ../patch/0001-configs-x86-allow-to-override-CONFIG_BOOTCOMMAND.patch

git am ../patch/0001-configs-sunxi-enable-BLK-DM_MMC-for-Bananapi.patch

# <<< start of block driver series
git am ../patch/0001-efi_driver-EFI-block-driver.patch
git am ../patch/0001-efi_selftest-provide-a-test-for-block-io.patch
# >>> end of block driver series

git am ../patch/0001-dm-video-Correct-color-ANSI-escape-sequence-support.patch
git am ../patch/0001-efi_loader-memory-reservations-according-to-e820-tab.patch
git am ../patch/0001-efi_loader-use-built-in-device-tree-in-bootefi-comma.patch
git am ../patch/0001-log-add-category-LOGC_EFI.patch

# Work in progress
# git am ../patch/0001-efi_loader-debug-print-memory-map.patch
# git am ../patch/0001-efi_loader-Exit-must-remove-loaded-image-handle.patch
# git am ../patch/0001-efi_loader-allow-multiple-source-files-for-EFI-apps.patch
