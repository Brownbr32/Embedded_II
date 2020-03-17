 export PATH=$PATH:/mnt/c/u-boot/tools        # edit this path to point to the tools in the u-boot directory
 ./u-boot/tools/mkimage -A arm -T ramdisk -c gzip -d ./ramdisk8M.image.gz uramdisk.image.gz
