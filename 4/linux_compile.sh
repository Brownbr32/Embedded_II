#!/bin/bash
setenv
if [ ! -d "./compileDebug" ]; then
    mkdir ./compileDebug;                            # makes the directory for the installation logs,
													# if not already present.
fi
make clean;
make xilinx_zynq_defconfig -j 80 | tee ../compileDebug/xilinx_zynq_defconfig.txt; # sets configs
make -j 80 | tee ../compileDebug/linuxCompile.txt;
echo $PATH | tee ../compileDebug/PATH.txt; # this prints the PATH variable
make UIMAGE_LOADADDR=0x8000 uImage -j 10 | tee ../compileDebug/z2uImage.txt; # unzips image
