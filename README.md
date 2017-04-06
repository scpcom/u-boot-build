u-boot-odroid-c2
================

Build U-Boot for Odroid C2.

This project is work in progress and not yet completely usable.

Install prerequisites
---------------------

Cross toolchain

    sudo dpkg --add-architecture arm64
    sudo apt-get update
    sudo apt-get install crossbuild-essential-arm64

Other dependencies

    sudo apt-get install bc build-essential device-tree-compiler \
    git libncurses5-dev

Build
-----

    make

