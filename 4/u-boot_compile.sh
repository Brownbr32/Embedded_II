#!/bin/bash
source setenv

export PATH=/brockxilinx/.settings64-Vivado.sh:.settings64-DocNav.sh:.settings64-SDK_Core_Tools.sh:$PATH

make distclean
make zynq_zybo_defconfig
make ARCH=arm CROSS_COMPILE=arm-none-eabi-
