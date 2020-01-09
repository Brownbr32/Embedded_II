#!/bin/bash
export PATH=$(pwd)/tools:$PATH
export ARCH=arm
export CROSS_COMPILE=arm-none-eabi-
rm -r spl
make distclean
make zynq_zybo_defconfig
make ARCH=arm CROSS_COMPILE=arm-none-eabi-
