TAG=2017.03

all: prepare build

prepare:
	test -d denx || git clone -v \
	http://git.denx.de/u-boot.git denx
	cd denx && git fetch
	gpg --list-keys 87F9F635D31D7652 || \
	gpg --keyserver keys.gnupg.net --recv-key 87F9F635D31D7652

build:
	cd denx && git verify-tag v$(TAG) 2>&1 | \
	grep 'E872 DB40 9C1A 687E FBE8  6336 87F9 F635 D31D 7652'
	cd denx && git checkout v$(TAG)
	cd denx && ( git branch -D build || true )
	cd denx && git checkout -b build
	test ! -f patch/patch-$(TAG) || ( cd denx && ../patch/patch-$(TAG) )
	cd denx && make distclean
	cp config/config-$(TAG) denx/.config
	cd denx && make oldconfig
	cd denx && ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make -j6
