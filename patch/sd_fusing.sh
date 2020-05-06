#!/bin/bash

#
# initial fusing script for ODROID-N1 with Rockchip RK3399
#

IDBLOADER=idbloader.img
UBOOT=uboot.img
TRUST=trust.img

if [ -z $1 ]; then
        echo "Usage ./sd_fusing.sh <SD card reader's device>"
        exit 1
fi

sudo dd if=$IDBLOADER of=$1 conv=fsync bs=512 seek=64 conv=fdatasync
sudo dd if=$UBOOT of=$1 conv=fsync bs=512 seek=16384 conv=fdatasync
sudo dd if=$TRUST of=$1 conv=fsync bs=512 seek=24576 conv=fdatasync

sync

sudo eject $1
echo finished
