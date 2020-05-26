#!/usr/bin/dash -e

# Copyright (c) 2018-2020, Firas Khalil Khana
# Distributed under the terms of the ISC License

mount /dev/sdc1 /mnt/USB1 &&
rm -frv /mnt/USB1/* /mnt/USB1/.* &&
umount /dev/sdc1 &&

wipefs --all /dev/sdc &&
parted -a optimal /dev/sdc mklabel msdos &&
parted -a optimal /dev/sdc mkpart primary 0% 100% &&
parted -a optimal /dev/sdc set 1 boot on &&
mkfs.ext4 -F /dev/sdc1 &&

mount /dev/sdc1 /mnt/USB1 &&
rm -frv /mnt/USB1/* /mnt/USB1/.*
