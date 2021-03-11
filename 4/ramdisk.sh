#!/bin/bash
inPath=${1:-./ramdisk8M.image.gz}
outPath=${2:-.}
mkimage -A arm -T ramdisk -c gzip -d $inPath $outPath/uramdisk.image.gz
