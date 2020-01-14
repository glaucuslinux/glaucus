#!/usr/bin/dash -e

# Copyright (c) 2019-2020, Firas Khalil Khana
# Distributed under the terms of the ISC License

NAME=glaucus.img
SIZE=1G
LOOP=$(losetup -f)
RSYNC='/usr/bin/rsync -vaHAXSx'

cd /home/glaucus

qemu-img create -f raw $NAME $SIZE
dd if=scripts/other/mbr.bin of=glaucus.img conv=notrunc bs=440 count=1

parted -s $NAME mklabel msdos
parted -s -a none $NAME mkpart primary ext4 0 $SIZE
parted -s -a none $NAME set 1 boot on

losetup -D
losetup $LOOP $NAME

partx -a $LOOP
mkfs.ext4 $(printf $LOOP)p1

umount /mnt/loop
mount $(printf $LOOP)p1 /mnt/loop

rm -frv /mnt/loop/lost+found

install -dv /mnt/loop/dev /mnt/loop/proc /mnt/loop/run /mnt/loop/sys
$RSYNC boot etc root usr var /mnt/loop --delete

install -dv /mnt/loop/boot/extlinux
$RSYNC scripts/other/extlinux.conf /mnt/loop/boot/extlinux
extlinux --install /mnt/loop/boot/extlinux

umount /mnt/loop
partx -d $LOOP
losetup -d $LOOP
