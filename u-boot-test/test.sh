#!/bin/sh
export PATH=$(pwd):/usr/bin:/bin
export PYTHONPATH=$(pwd)
# cd ../denx && ./test/py/test.py --bd=qemu-x86 --build-dir=. -k=test_efi_selftest.py
cd ../denx && ./test/py/test.py --bd=qemu-x86 --build-dir=.
