#!/bin/sh
git am ../patch/0001-dm-fix-typo-falback.patch

git am ../patch/0001-ubifs-avoid-possible-NULL-dereference.patch

git am ../patch/0001-fs-remove-distractive-message-in-fs_read.patch
git am ../patch/0001-fs-fat-remove-distractive-message-in-file_fat_read_a.patch

# git am ../patch/0001-Test-vexpress-only.patch
git am ../patch/0001-vexpress_ca15_tc2_defconfig-build-EFI.patch

# Fix building u-boot.rom for qemu-x86_64_defconfig
git am ../patch/0001-spl-u-boot-spl-nodtb.bin-remove-.got-and-.got.plt-se.patch

git am ../patch/0001-vsprintf.c-add-EFI-device-path-printing.patch

git am ../patch/0001-board_r-remove-superfluous-ifdef-CONFIG_PRAM.patch

git am ../patch/0001-MAINTAINERS-correct-entry-for-lib-efi.patch

git am ../patch/0001-configs-x86-allow-to-override-CONFIG_BOOTCOMMAND.patch

git am ../patch/0001-configs-sunxi-enable-BLK-DM_MMC-for-Bananapi.patch

# <<< start of protocol series 4
git am ../patch/0001-efi_selftest-colored-test-output.patch
git am ../patch/0001-efi_loader-simplify-efi_remove_all_protocols.patch
git am ../patch/0001-efi_selftest-do-not-try-to-close-device-path-protoco.patch
git am ../patch/0001-efi_loader-list-of-open-protocol-infos.patch
git am ../patch/0001-efi_loader-open_info-in-OpenProtocol.patch
git am ../patch/0001-efi_loader-open_info-in-CloseProtocol.patch
git am ../patch/0001-efi_loader-implement-OpenProtocolInformation.patch
git am ../patch/0001-efi_loader-debug-output-installed-device-path.patch
git am ../patch/0001-efi_loader-implement-ConnectController.patch
git am ../patch/0001-efi_loader-fix-signature-of-efi_disconnect_controlle.patch 
git am ../patch/0001-efi_loader-implement-DisconnectController.patch
git am ../patch/0001-efi_loader-disconnect-controllers-in-UninstallProtoc.patch
git am ../patch/0001-efi_selftest-remove-todo-in-manage-protocols.patch
git am ../patch/0001-efi_selftest-remove-todo-in-device-path-test.patch
git am ../patch/0001-efi_selftest-test-for-Dis-ConnectController.patch
git am ../patch/0001-efi_loader-consistently-use-efi_handle_t-for-handles.patch
# git am ../patch/0001-Debug-boottime.patch
# >>> end of protocol series 4

# <<< start of beautify selftest output
git am ../patch/0001-efi_selftest-avoid-superfluous-messages-for-event-se.patch
git am ../patch/0001-efi_selftest-avoid-superfluous-messages-for-task-pri.patch
git am ../patch/0001-efi_selftest-do-not-cut-off-u16-strings-when-printin.patch
# >>> end of beautify selftest output

git am ../patch/0001-efi_loader-use-correct-format-string-for-unsigned-lo.patch

# <<< start of simple file system protocol
git am ../patch/0001-efi_loader-return-NULL-from-device-path-functions.patch
git am ../patch/0001-efi_loader-address-of-the-simple-file-system-protoco.patch
git am ../patch/0001-efi_loader-correct-find-simple-file-system-protocol.patch
# >>> end of simple file system protocol

# <<< device path output series
git am ../patch/0001-efi_loader-print-device-path-when-entering-efi_load_.patch
# >>> end of device path output series

# <<< start of block driver series
git am ../patch/0001-efi_loader-allocate-correct-memory-type-if-EFI-image.patch
git am ../patch/0001-efi_loader-check-tables-in-helloworld.efi.patch
git am ../patch/0001-efi_loader-fix-StartImage-bootservice.patch
git am ../patch/0001-efi_loader-efi_disk_register-correctly-determine-if_.patch
git am ../patch/0001-efi_loader-make-efi_block_io_guid-a-global-symbol.patch
git am ../patch/0001-efi_loader-provide-a-function-to-create-a-partition-.patch
git am ../patch/0001-efi_loader-make-efi_disk_create_partitions-a-global-.patch
# git am ../patch/0001-efi_selftest-execute-only-block-device-test.patch
git am ../patch/0001-efi_loader-correct-EFI_BLOCK_IO_PROTOCOL-definitions.patch
git am ../patch/0001-efi_loader-provide-function-to-get-last-node-of-a-de.patch
git am ../patch/0001-efi_loader-provide-links-between-devices-EFI-handles.patch
git am ../patch/0001-tools-provide-a-tool-to-convert-a-binary-file-to-an-.patch
git am ../patch/0001-efi_selftest-provide-a-test-for-block-io.patch
git am ../patch/0001-efi_driver-EFI-block-driver.patch
# >>> end of block driver series

git am ../patch/0001-efi_loader-correctly-call-images.patch
git am ../patch/0001-efi_selftest-test-start-image.patch
git am ../patch/0001-dm-video-Correct-color-ANSI-escape-sequence-support.patch

# Work in progress
# git am ../patch/0001-efi_loader-debug-print-memory-map.patch
# git am ../patch/0001-efi_loader-Exit-must-remove-loaded-image-handle.patch
# git am ../patch/0001-efi_loader-allow-multiple-source-files-for-EFI-apps.patch
