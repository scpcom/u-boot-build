TAG=2017.03

all: prepare build

prepare:
	test -d denx || git clone -v \
	http://git.denx.de/u-boot.git denx
	cd denx && git fetch

build:
	cd denx && git checkout v$(TAG)
	cd denx && ( git branch -D build || true )
	cd denx && git checkout -b build
	test ! -f patch/patch-$(TAG) || ( cd denx && ../patch/patch-$(TAG) )
	cd denx && make distclean
	cp config/config-$(TAG) denx/.config
	cd denx && make oldconfig
	cd denx && ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make -j6
