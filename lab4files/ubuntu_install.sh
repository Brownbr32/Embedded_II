#!/bin/bash
if [ ! -d "./tmp" ]; then
    mkdir tmp;                                      # makes the directory for the installation logs,
													# if not already present.
fi
echo "Executing sudo apt-get update"
sudo apt-get update -y > ./tmp/update.txt;          # sudo is Super User DO
                                                    # apt is...
                                                    # update...
                                                    # -y...   ...(not as secure)
                                                    # > is used to...
echo "Executing sudo apt-get upgrade"
sudo apt-get upgrade -y;        					# upgrade replaces old package links with new
echo "Executing sudo apt-get install dist-upgrade"
sudo apt-get install dist-upgrade -y > ./tmp/dist-upgrade.txt
echo "Executing sudo apt-get install gcc"
sudo apt-get install gcc -y > ./tmp/gcc.txt;        # used to....
echo "Executing sudo apt-get install libssl-dev"
sudo apt-get install libssl-dev \
            -y > ./tmp/libssl-dev.txt;              # u-boot is dependent upon this
echo "Executing sudo apt-get install make"
sudo apt-get install make -y > \
            ./tmp/make.txt;
echo "Executing sudo apt-get install arm*"
#sudo apt-get install arm* -y > ./tmp/arm.txt;
sudo apt-get install apt-file > ./tmp/apt-file.txt;
sudo apt-file update > ./tmp/apt-file_update.txt;
sudo apt-get install gcc-arm-none-eabi -y > ./tmp/arm-none-eabi.txt;
#
#
#
#
#
echo "Executing sudo apt-get install bison"
sudo apt-get install bison -y > ./tmp/bison.txt;    # bison is...
echo "Executing sudo apt-get install flex"
sudo apt-get install flex -y > ./tmp/flex.txt;      # flex is...
#echo "Executing sudo apt-get install gcc-arm-linux-gnueabihf"
#sudo apt-get install gcc-arm-linux-gnueabihf \
#            -y > ./tmp/gcc-arm-linux-gnueabihf.txt;       # the arm cross compiler (try 1.5)
#echo "Executing sudo apt-get install gcc-arm-none-eabi"
#sudo apt-get install gcc-arm-none-eabi \
#            -y > ./tmp/gcc-arm-none-eabi.txt;       # the arm cross compiler