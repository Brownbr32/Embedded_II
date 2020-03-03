#!/bin/bash
if [ ! -d "../linuxDebug" ]; then
    mkdir ../linuxDebug;                            # makes the directory for the installation logs,
													# if not already present.
fi
make ARCH=arm CROSS_COMPILE=arm-none-eabi- xilinx_zynq_defconfig | tee ../tmp4730/xilinx_zynq_defconfig.txt; # sets configs
make ARCH=arm CROSS_COMPILE=arm-none-eabi- | tee ../tmp4730/linuxCompile.txt;
PATH=$PATH:~/labFiles/master_labs/projLab4/u-boot/tools;			# Change this line to point to <u-boot directory>/tools
echo $PATH | tee ../tmp4730/PATH.txt; # this prints the PATH variable
make ARCH=arm CROSS_COMPILE=arm-none-eabi- UIMAGE_LOADADDR=0x8000 uImage | tee ../tmp4730/z2uImage.txt; # unzips image
