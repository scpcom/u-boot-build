# Build U-Boot for Odroid C2
.POSIX:

TAG=2017.09-rc2
TAGPREFIX=v
REVISION=001

NPROC=${shell nproc}

export LOCALVERSION:=-P$(REVISION)

all:
	make prepare
	make build

prepare:
	test -d denx || git clone -v \
	http://git.denx.de/u-boot.git denx
	cd denx && git fetch
	gpg --list-keys 87F9F635D31D7652 || \
	gpg --keyserver keys.gnupg.net --recv-key 87F9F635D31D7652
	test -f ~/.gitconfig || \
	  ( git config --global user.email "somebody@example.com"  && \
	  git config --global user.name "somebody" )

build:
	cd denx && git fetch origin
	# cd denx && git fetch agraf
	# cd denx && git verify-tag $(TAGPREFIX)$(TAG) 2>&1 | \
	# grep 'E872 DB40 9C1A 687E FBE8  6336 87F9 F635 D31D 7652'
	cd denx && (git am --abort || true)
	cd denx && git reset --hard
	# cd denx && git checkout $(TAGPREFIX)$(TAG)
	# cd denx && git checkout efi-next
	cd denx && git checkout master
	# cd denx && git reset --hard HEAD~30
	cd denx && git rebase
	cd denx && ( git branch -D build || true )
	cd denx && ( git am --abort || true )
	cd denx && git checkout -b build
	# cd denx && ../patch/patch-$(TAG)
	cd denx && ../patch/patch-efi-next
	cd denx && make distclean
	cp config/config-$(TAG) denx/.config
	# cp config/config-efi-next denx/.config
	cd denx && make oldconfig
	cd denx && make -j$(NPROC)

clean:

install:

uninstall:
