make ARCH=arm CROSS_COMPILE=arm-none-eabi- xilinx_zynq_defconfig | tee ../tmp_dtb/xilinx_zynq_defconfig.txt; # sets configs
make dtbs ARCH=arm CROSS_COMPILE=arm-none-eabi-