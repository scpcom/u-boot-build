u-boot-odroid-n1
================

Build U-Boot for Odroid N1.

Install prerequisites
---------------------

Cross toolchain

    sudo dpkg --add-architecture arm64
    sudo apt-get update
    sudo apt-get install crossbuild-essential-arm64

Other dependencies

    sudo apt-get install bc build-essential device-tree-compiler \
    git libncurses5-dev libssl-dev libpython-dev

Build
-----

    make
    sudo make install

Write to SD card
----------------

    cd /usr/lib/u-boot/odroid-n1/
    sudo ./sd_fusing.sh DEVICE

Replace DEVICE by the relevant SD card (e.g. /dev/sdg).

Specifying the wrong device may lead to data loss or may render your
computer non bootable.
