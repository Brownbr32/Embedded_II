#!/bin/bash
export PATH=/brockxilinx/.settings64-Vivado.sh:.settings64-DocNav.sh:.settings64-SDK_Core_Tools.sh:$PATH
export PATH=$(pwd)/tools:$PATH
export ARCH=arm
export CROSS_COMPILE=arm-none-eabi-
make distclean
make zynq_zybo_defconfig
make ARCH=arm CROSS_COMPILE=arm-none-eabi-
