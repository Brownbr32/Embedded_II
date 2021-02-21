#!/bin/bash

wd=`pwd`

cp -r /tars-an ~
os=~/labs/os
if [ ! -d $os ]; then
   mkdir ~/labs/os 
fi

cd ~/labs/os

echo untarring u-boot. Shouldn\'t exceed a minute or two...
tar -xvf ~/tars-an/u-boot-xlnx-xilinx-v2019.1.tar.gz
mv ~/labs/os/u-boot-xlnx-xilinx-v2019.1 ~/labs/os/uboot

echo now untarring linux\; shouldn\'t exceed 5 minutes...
tar -xvf ~/tars-an/linux-xlnx-xilinx-v2019.1.tar.gz
mv ~/linux-xlnx-xilinx-v2019.1.tar.gz linux

bin=$os/bin
if [ ! -d $bin ]; then
   mkdir $bin
fi
sd=$os/sd
if [ ! -d $sd ]; then
   mkdir $sd
fi

source $wd/setenv.sh
