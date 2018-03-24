#!/bin/sh

# git am ../patch/0001-Test-vexpress-only.patch
git am ../patch/0001-vexpress_ca15_tc2_defconfig-build-EFI.patch

# Fix building u-boot.rom for qemu-x86_64_defconfig
git am ../patch/0001-spl-u-boot-spl-nodtb.bin-remove-.got-and-.got.plt-se.patch

# Support EFI block device on BananaPi
# git am ../patch/0001-configs-sunxi-enable-BLK-DM_MMC-DM_SCSI.patch
git am ../patch/0001-configs-sunxi-enable-BLK-DM_MMC-for-Bananapi.patch

# Various fixes
git am ../patch/0001-ubifs-avoid-possible-NULL-dereference.patch
git am ../patch/0001-mmc-avoid-division-by-zero-in-meson_mmc_config_clock.patch
git am ../patch/0001-fs-fat-avoid-useless-conversion-when-calling-get_clu.patch
git am ../patch/0001-fs-fat-avoid-superfluous-conversion-calling-set_clus.patch
git am ../patch/0001-net-mvpp2x-add-check-after-calloc.patch
git am ../patch/0001-wandboard-remove-superfluous-include.patch
git am ../patch/0001-env-typo-in-description-of-ENV_IS_IN_REMOTE.patch
git am ../patch/0001-bios_emulator-remove-assignment-without-effect.patch
git am ../patch/0001-i2c-lpi2c-remove-superfluous-assignments.patch
git am ../patch/0001-drivers-net-cpsw-remove-superfluous-assignment.patch
git am ../patch/0001-net-macb-remove-superfluous-logical-constraint.patch
git am ../patch/0001-drivers-power-max77693-remove-redundant-logical-cons.patch
git am ../patch/0001-regulator-pbias-don-t-evaluate-variable-before-assig.patch
git am ../patch/0001-driver-ram-rockchip-rk3399-missing-counter-increment.patch
git am ../patch/0001-spi-atcspi200-avoid-NULL-dereference.patch
git am ../patch/0001-spi-fsl_qspi-remove-superfluous-assignment.patch
git am ../patch/0001-spi-lpc32xx-simplify-logical-expression.patch
git am ../patch/0001-usb-dwc3-remove-superfluous-assignment.patch
git am ../patch/0001-usb-gadget-remove-duplicate-assignment.patch
git am ../patch/0001-usb-f_mass_storage-simplify-logical-expression.patch
git am ../patch/0001-usb-rockchip-remove-duplicate-assignement.patch
git am ../patch/0001-usb-sl811-hcd-remove-duplicate-assignment.patch
git am ../patch/0001-usb-xhci-exynos5-correct-error-checking.patch
git am ../patch/0001-usb-xhci-keystone-remove-superfluous-assignment.patch
git am ../patch/0001-usb-xhci-ring-remove-superfluous-assignment.patch
git am ../patch/0001-usb-xhci-remove-superfluous-assignment.patch
git am ../patch/0001-usb-musb-remove-superfluous-assignment.patch
git am ../patch/0001-usb-musb-new-misplaced-out-of-bounds-check.patch
git am ../patch/0001-video-stb_truetype-simplify-expression.patch
git am ../patch/0001-video-da8xx-fb-fix-time-out-in-wait_for_event.patch
git am ../patch/0001-video-exynos-remove-redundant-assignments.patch
git am ../patch/0001-video-rk3399_mipi-correct-error-checking.patch
git am ../patch/0001-video-rk3288_mipi-check-in-rk_mipi_ofdata_to_platdat.patch
git am ../patch/0001-usb-ehci-faraday-remove-unused-driver.patch
git am ../patch/0001-usb-ehci-hcd-eliminate-tweaks-used-for-faraday.patch
git am ../patch/0001-lib-slre-remove-superfluous-assignment.patch
git am ../patch/0001-mips-micronas-vct-check-array-bounds-before-access.patch

# Video console
git am ../patch/0001-video-if-EFI_LOADER-is-enabled-enable-CFB_CONSOLE_AN.patch
git am ../patch/0001-video-cfb_console-simplify-logical-constraint.patch

# USB keyboard
git am ../patch/0001-usb-proper-error-handling-for-circular-buffer.patch
git am ../patch/0001-usb-kbd-allow-multibyte-sequences-to-be-put-into-rin.patch
git am ../patch/0001-usb-kbd-implement-special-keys.patch

# diverse protocols
git am ../patch/0001-efi_loader-efi_allocate_pages-is-too-restrictive.patch

# From Simon's Sandbox support series
git am ../patch/0001-efi-Add-a-TODO-to-efi_init_obj_list.patch # rebased

# GOP
git am ../patch/0001-efi_loader-Optimize-GOP-switch.patch
git am ../patch/0001-efi_loader-Optimize-GOP-more.patch
git am ../patch/0001-efi_loader-use-__always_inline-for-pixel-conversion.patch

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
