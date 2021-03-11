#!/bin/bash

tools=~/labs/os/uboot/tools

if [ `grep -c $tools ~/.profile` == "0" ]; then
   echo PATH=\$PATH:~/labs/os/uboot/tools >> ~/.profile
   if [ ! -d ~/.local/bin ]; then
      mkdir ~/.local/bin
   fi
   ln -s `pwd`/setenv.sh ~/.local/bin/setenv
fi

source ~/.profile
if [ `echo $PATH | grep -c $tools` == "0" ]; then
   source ~/.profile
fi

export ARCH=arm 
export CROSS_COMPILE=arm-none-eabi- 
