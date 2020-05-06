# Build U-Boot for Odroid N1
.POSIX:

TAG=2017.09
TAGPREFIX=v
REVISION=1058

MESON_TOOLS_TAG=v0.1

MK_ARCH="${shell uname -m}"
ifneq ("aarch64", $(MK_ARCH))
	export ARCH=arm64
	export CROSS_COMPILE=aarch64-linux-gnu-
endif
undefine MK_ARCH

export LOCALVERSION:=-R$(REVISION)

all:
	make prepare
	make build
	##make fip_create
	##make sign

prepare:
	test -d rkbin || git clone -v \
	-b stable-4.4-rk3399-linux https://github.com/rockchip-linux/rkbin
	cd rkbin && git fetch
	test -f ~/.gitconfig || \
	  ( git config --global user.email "somebody@example.com"  && \
	  git config --global user.name "somebody" )

build:
	cd denx && ./build.sh

fip_create:
	cd hardkernel && git fetch
	cd hardkernel && git reset --hard
	cd hardkernel && git checkout f9a34305b098cf3e78d2e53f467668ba51881e91
	cd hardkernel && ( git branch -D build || true )
	cd hardkernel && git checkout -b build
	test ! -f patch/patch-hardkernel || \
	  ( cd hardkernel && ../patch/patch-hardkernel )
	cd hardkernel/tools/fip_create && make
	cp hardkernel/tools/fip_create/fip_create hardkernel/fip
	cp denx/u-boot.bin hardkernel/fip/gxb/bl33.bin
	cd hardkernel/fip/gxb && ../fip_create \
	  --bl30 bl30.bin --bl301 bl301.bin \
	  --bl31 bl31.bin --bl33 bl33.bin fip.bin
	cd hardkernel/fip/gxb && cat bl2.package fip.bin > boot_new.bin

sign:
	cd rkbin && git fetch
	cd rkbin && git verify-tag $(MESON_TOOLS_TAG) 2>&1 | \
	grep '174F 0347 1BCC 221A 6175  6F96 FA2E D12D 3E7E 013F'
	cd rkbin && git reset --hard
	cd rkbin && git checkout $(MESON_TOOLS_TAG)
	cd rkbin && make CC=gcc
	rkbin/amlbootsig hardkernel/fip/gxb/boot_new.bin u-boot.bin

clean:
	test ! -d denx        || ( cd denx && make clean )
	rm -f u-boot.bin

install:
	mkdir -p $(DESTDIR)/usr/lib/u-boot/odroid-n1/
	cp denx/sd_fuse/idbloader.img $(DESTDIR)/usr/lib/u-boot/odroid-n1/
	cp denx/sd_fuse/uboot.img $(DESTDIR)/usr/lib/u-boot/odroid-n1/
	cp denx/sd_fuse/trust.img $(DESTDIR)/usr/lib/u-boot/odroid-n1/
	cp patch/sd_fusing.sh $(DESTDIR)/usr/lib/u-boot/odroid-n1/

uninstall:
	rm -rf $(DESTDIR)/usr/lib/u-boot/odroid-n1/
