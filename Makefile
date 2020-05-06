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

prepare:
	test -d rkbin || git clone -v \
	-b stable-4.4-rk3399-linux https://github.com/rockchip-linux/rkbin
	cd rkbin && git fetch
	test -f ~/.gitconfig || \
	  ( git config --global user.email "somebody@example.com"  && \
	  git config --global user.name "somebody" )

build:
	cd denx && ./build.sh

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
