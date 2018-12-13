#!/bin/dash -ex
sudo mount /dev/sdc1 /mnt/USB1
sudo rm -rfv /mnt/USB1/*
sudo rm -rfv /mnt/USB1/.*
sudo umount /dev/sdc1
sudo wipefs --all /dev/sdc
sudo parted -a optimal /dev/sdc mklabel msdos
sudo parted -a optimal /dev/sdc mkpart primary 0% 100%
sudo parted -a optimal /dev/sdc set 1 boot on
sudo mkfs.ext4 -F /dev/sdc1
sudo mount /dev/sdc1 /mnt/USB1
sudo rm -rfv /mnt/USB1/*
sudo rm -rfv /mnt/USB1/.*
