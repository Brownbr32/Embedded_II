#!/bin/bash
	#export PATH = mnt/c/Xilinx/Vivado/2019.1/.settings64-SDK_Core_Tools.sh:mnt/c/Xilinx/Vivado/2019.1/.settings64-DocNav.sh:mnt/c/Xilinx/Vivado/2019.1/.settings64-Vivado.sh:$PATH
export PATH=$(pwd)/tools:$PATH
export ARCH=arm
export CROSS_COMPILE=arm-none-eabi-
rm -r spl
make distclean
make zynq_zybo_defconfig
make ARCH=arm CROSS_COMPILE=arm-none-eabi-
