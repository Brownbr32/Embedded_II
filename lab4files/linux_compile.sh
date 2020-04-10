#!/bin/bash
if [ ! -d "./compileDebug" ]; then
    mkdir ./compileDebug;                            # makes the directory for the installation logs,
													# if not already present.
fi
make ARCH=arm CROSS_COMPILE=arm-none-eabi- xilinx_zynq_defconfig | tee ../compileDebug/xilinx_zynq_defconfig.txt; # sets configs
make ARCH=arm CROSS_COMPILE=arm-none-eabi- -j 12| tee ../compileDebug/linuxCompile.txt;
export PATH=$PATH:~/u-boot/tools;			# Change this line to point to <u-boot directory>/tools
echo $PATH | tee ../compileDebug/PATH.txt; # this prints the PATH variable
make ARCH=arm CROSS_COMPILE=arm-none-eabi- UIMAGE_LOADADDR=0x8000 uImage | tee ../compileDebug/z2uImage.txt; # unzips image
