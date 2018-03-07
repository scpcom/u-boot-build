#!/bin/sh

# git am ../patch/0001-Test-vexpress-only.patch
git am ../patch/0001-vexpress_ca15_tc2_defconfig-build-EFI.patch

# Fix building u-boot.rom for qemu-x86_64_defconfig
git am ../patch/0001-spl-u-boot-spl-nodtb.bin-remove-.got-and-.got.plt-se.patch

# Support EFI block device on BananaPi
git am ../patch/0001-mmc-sunxi-support-cd-inverted.patch
git am ../patch/0001-configs-sunxi-enable-BLK-DM_MMC-for-Bananapi.patch

# Various fixes
git am ../patch/0001-ubifs-avoid-possible-NULL-dereference.patch
git am ../patch/0001-mmc-meson_gx_mmc-avoid-division-by-zero.patch
git am ../patch/0001-fs-fat-avoid-useless-conversion-when-calling-get_clu.patch
git am ../patch/0001-fs-fat-avoid-superfluous-conversion-calling-set_clus.patch

# Video console
git am ../patch/0001-dm-video-show-correct-colors-in-graphical-console.patch
git am ../patch/0001-dm-video-correctly-clean-background-in-16bit-mode.patch
git am ../patch/0001-dm-video-use-constants-to-refer-to-colors.patch
git am ../patch/0001-dm-video-support-increased-intensity-bold.patch
git am ../patch/0001-video-indicate-code-page-of-bitmap-fonts.patch
git am ../patch/0001-sunxi-video-mark-framebuffer-as-EFI-reserved-memory.patch
git am ../patch/0001-video-if-EFI_LOADER-is-enabled-enable-CFB_CONSOLE_AN.patch

# USB keyboard
git am ../patch/0001-usb-proper-error-handling-for-circular-buffer.patch
git am ../patch/0001-usb-kbd-allow-multibyte-sequences-to-be-put-into-rin.patch
git am ../patch/0001-usb-kbd-implement-special-keys.patch

# EFI
git am ../patch/0001-efi_loader-delete-doc-README.efi.patch
git am ../patch/0001-efi_loader-provide-new-doc-README.uefi.patch
git am ../patch/0001-efi_loader-check-parameter-in-InstallConfigurationTa.patch
git am ../patch/0001-efi_loader-clear-signaled-state-in-CheckEvent.patch
git am ../patch/0001-efi_loader-correct-input-of-special-keys.patch

# cmd/bootefi series
git am ../patch/0001-efi_loader-efi_smbios_register-should-have-a-return-.patch
git am ../patch/0001-efi_loader-return-efi_status_t-from-efi_gop_register.patch
git am ../patch/0001-efi_loader-return-efi_status_t-from-efi_net_register.patch
git am ../patch/0001-efi_loader-consistently-return-efi_status_t-efi_watc.patch
git am ../patch/0001-efi_loader-simplify-calling-efi_init_obj_list.patch
git am ../patch/0001-efi_loader-exit-status-for-efi_reset_system_init.patch
git am ../patch/0001-efi_loader-efi_get_time_init-should-return-status-co.patch
git am ../patch/0001-efi_loader-do_bootefi_exec-should-always-return-an-E.patch
git am ../patch/0001-efi_loader-check-initialization-of-EFI-subsystem-is-.patch
git am ../patch/0001-efi_loader-support-device-tree-for-bootefi-selftest.patch
git am ../patch/0001-efi_selftest-check-installation-of-the-device-tree.patch

# diverse protocols
git am ../patch/0001-efi_selftest-unit-test-for-EFI_SIMPLE_TEXT_INPUT_PRO.patch
git am ../patch/0001-efi_loader-use-constants-in-efi_allocate_pages.patch
git am ../patch/0001-efi_loader-add-missing-EFI_RESET_PLATFORM_SPECIFIC.patch
git am ../patch/0001-efi_loader-remove-deprecated-ConsoleControlProtocol.patch
git am ../patch/0001-efi_loader-show-UEFI-revision-in-helloworld.patch
git am ../patch/0001-efi_loader-implement-missing-bit-blit-operations-in-.patch
git am ../patch/0001-efi_selftest-test-gop-bitblt.patch
git am ../patch/0001-efi-Correct-header-order-in-efi_memory.patch
git am ../patch/0001-efi_loader-efi_allocate_pages-is-too-restrictive.patch
git am ../patch/0001-efi_loader-parameter-checks-for-LoadImage.patch

# Event groups
# git am ../patch/0001-efi_loader-check-parameters-of-guidcmp.patch
git am ../patch/0001-efi_loader-fix-formatting-errors.patch
git am ../patch/0001-efi_loader-manage-events-in-a-linked-list.patch
git am ../patch/0001-efi_loader-define-GUIDS-for-event-groups.patch
git am ../patch/0001-efi_loader-implement-event-groups.patch
git am ../patch/0001-efi_selftest-unit-test-for-event-groups.patch

# From Robert's Shell support series
git am ../patch/0001-efi_loader-Initial-EFI_DEVICE_PATH_UTILITIES_PROTOCO.patch

exit
# From Simon's Sandbox support series
git am ../patch/0001-sandbox-set-available-memory-address.patch
git am ../patch/0001-efi-sandbox-Adjust-memory-usage-for-sandbox.patch # no change
git am ../patch/0001-sandbox-smbios-Update-to-support-sandbox.patch # no change
git am ../patch/0001-sandbox-Add-a-setjmp-implementation.patch # no change
git am ../patch/0001-efi-sandbox-Add-required-linker-sections.patch # no change
git am ../patch/0001-efi-sandbox-add-distroboot-support.patch
git am ../patch/0001-Define-board_quiesce_devices-in-a-shared-location.patch
git am ../patch/0001-Add-a-comment-for-board_quiesce_devices.patch # no change
git am ../patch/0001-efi-sandbox-Add-relocation-constants.patch # no change
git am ../patch/0001-efi-sandbox-no-support-for-DHCP-EFI-boot.patch
git am ../patch/0001-efi_selftest-cannot-launch-EFI-binary-in-sandbox.patch
git am ../patch/0001-sandbox-alignment-of-memory.patch
git am ../patch/0001-efi-sandbox-Enable-EFI-loader-builder-for-sandbox.patch # rebased

# To be reworked
# git am ../patch/0001-efi_loader-memory-reservations-according-to-e820-tab.patch

# git am ../patch/0001-efi_loader-clean-up-efi_exit.patch
# git am ../patch/0001-efi_loader-correct-return-types-do_bootefi_exec.patch
# git am ../patch/0001-efi_loader-call-efi_setup_loaded_image-first.patch

# Work in progress
# git am ../patch/0001-efi_loader-debug-print-memory-map.patch
# git am ../patch/0001-efi_loader-Exit-must-remove-loaded-image-handle.patch
# git am ../patch/0001-efi_loader-allow-multiple-source-files-for-EFI-apps.patch
