#!/bin/sh
git am ../patch/0001-ubifs-avoid-possible-NULL-dereference.patch
git am ../patch/0001-cmd-bdinfo-print-relocation-info-on-X86.patch

# git am ../patch/0001-Test-vexpress-only.patch
git am ../patch/0001-vexpress_ca15_tc2_defconfig-build-EFI.patch

# Fix building u-boot.rom for qemu-x86_64_defconfig
git am ../patch/0001-spl-u-boot-spl-nodtb.bin-remove-.got-and-.got.plt-se.patch

git am ../patch/0001-configs-x86-allow-to-override-CONFIG_BOOTCOMMAND.patch

git am ../patch/0001-configs-sunxi-enable-BLK-DM_MMC-for-Bananapi.patch

# <<< start of block driver series
# git am ../patch/0001-efi_driver-EFI-block-driver.patch
# git am ../patch/0001-efi_selftest-provide-a-test-for-block-io.patch
# >>> end of block driver series

git am ../patch/0001-efi_loader-memory-reservations-according-to-e820-tab.patch
git am ../patch/0001-log-add-category-LOGC_EFI.patch
# git am ../patch/0001-efi_loader-allow-creation-of-more-device-part-nodes.patch
# git am ../patch/0001-efi_selftest-reduce-noise-in-test-output-for-device-.patch
# git am ../patch/0001-efi_selftest-add-missing-LF-in-test-output.patch

# Rebasing needed
# git am ../patch/0001-efi_loader-use-built-in-device-tree-in-bootefi-comma.patch
# git am ../patch/0001-efi_selftest-check-installation-of-the-device-tree.patch

# Superseded
# git am ../patch/0001-efi_loader-always-call-Exit-after-an-image-returns.patch

# Merged
# git am ../patch/0001-vsprintf.c-correct-printing-of-a-NULL-device-path.patch
# git am ../patch/0001-efi_loader-do-not-install-NULL-as-device-path.patch
# git am ../patch/0001-efi_loader-consistently-use-pD-to-print-device-paths.patch
# git am ../patch/0001-efi_loader-fix-comments-indent_string.patch
# git am ../patch/0001-efi_loader-catch-mispelled-bootefi-subcommand.patch
# git am ../patch/0001-efi_loader-always-call-Exit-after-an-image-returns.patch
# git am ../patch/0001-efi_loader-add-a-README.iscsi-describing-booting-via.patch

git am ../patch/0001-efi_loader-split-README.efi-into-two-separate-docume.patch
git am ../patch/0001-efi_loader-rewrite-README.efi.patch

git am ../patch/0001-dm-video-show-correct-colors-in-graphical-console.patch
git am ../patch/0001-dm-video-Correct-color-ANSI-escape-sequence-support.patch
# Has to be rebased
# git am ../patch/0001-efi_loader-use-always-same-signature-for-EFI-entry-p.patch

# Work in progress
# git am ../patch/0001-efi_loader-debug-print-memory-map.patch
# git am ../patch/0001-efi_loader-Exit-must-remove-loaded-image-handle.patch
# git am ../patch/0001-efi_loader-allow-multiple-source-files-for-EFI-apps.patch
