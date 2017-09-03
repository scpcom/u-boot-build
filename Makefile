# Build U-Boot for Odroid C2
.POSIX:

TAG=2017.09-rc2
TAGPREFIX=v
REVISION=001

NPROC=${shell nproc}

PATH:=$(PATH):$(CURDIR)/u-boot-test
export PATH

PYTHONPATH:=$(CURDIR)/u-boot-test
export PYTHONPATH

export LOCALVERSION:=-P$(REVISION)
export BUILD_ROM=y

all:
	make prepare
	make build

prepare:
	test -d denx || git clone -v \
	http://git.denx.de/u-boot.git denx
	cd denx && (git fetch origin || true)
	gpg --list-keys 87F9F635D31D7652 || \
	gpg --keyserver keys.gnupg.net --recv-key 87F9F635D31D7652
	test -d ipxe || git clone -v \
	http://git.ipxe.org/ipxe.git ipxe
	test -f ~/.gitconfig || \
	  ( git config --global user.email "somebody@example.com"  && \
	  git config --global user.name "somebody" )
	test -d tftp || mkdir tftp

build-ipxe:
	cd ipxe && (git am --abort || true)
	cd ipxe && (git fetch origin || true)
	cd ipxe && (git am --abort || true)
	cd ipxe && git reset --hard
	cd ipxe && git checkout master
	cd denx && ( git am --abort || true )
	cd ipxe && git rebase
	cd ipxe && ( git branch -D build || true )
	cd ipxe && git checkout -b build
	mkdir -p ipxe/src/config/local/
	cp config/*.h ipxe/src/config/local/
	cp config/myscript.ipxe ipxe/src/config/local/
	cd ipxe/src && make bin-i386-efi/snp.efi -j$(NPROC) \
	EMBED=config/local/myscript.ipxe
	cp ipxe/src/bin-i386-efi/snp.efi tftp

build:
	test -f tftp/snp.efi || make build-ipxe
	# cd denx && (git fetch origin || true)
	cd denx && (git fetch agraf || true)
	# cd denx && git verify-tag $(TAGPREFIX)$(TAG) 2>&1 | \
	# grep 'E872 DB40 9C1A 687E FBE8  6336 87F9 F635 D31D 7652'
	cd denx && (git am --abort || true)
	cd denx && git reset --hard
	# cd denx && git checkout $(TAGPREFIX)$(TAG)
	cd denx && git checkout efi-next
	# cd denx && git checkout master
	# cd denx && git reset --hard HEAD~30
	cd denx && git rebase
	cd denx && ( git branch -D build || true )
	cd denx && ( git am --abort || true )
	cd denx && git checkout -b build
	# cd denx && ../patch/patch-$(TAG)
	cd denx && ../patch/patch-efi-next
	cd denx && make distclean
	cp config/config-$(TAG) denx/.config
	cd denx && make oldconfig
	cd denx && make -j$(NPROC)

unit-tests:
	# cd denx && test/py/test.py --bd qemu-x86 -k test_efi_dhcp
	# cd denx && test/py/test.py --bd qemu-x86 -k test_efi_helloworld_net
	cd denx && test/py/test.py --build-dir . --bd qemu-x86 -k test_efi_loader

luv:
	qemu-system-x86_64 -m 1G -bios denx/u-boot.rom -nographic \
	-netdev \
	user,id=eth0,tftp=tftp,net=192.168.76.0/24,dhcpstart=192.168.76.9 \
	-device e1000,netdev=eth0 -machine pc-i440fx-2.8 -hda img

check:
	qemu-system-x86_64 -m 1G -bios denx/u-boot.rom -nographic \
	-netdev \
	user,id=eth0,tftp=tftp,net=192.168.76.0/24,dhcpstart=192.168.76.9 \
	-device e1000,netdev=eth0 -machine pc-i440fx-2.8

clean:
	cd denx && make distclean
	rm tftp/snp.efi

install:

uninstall:
