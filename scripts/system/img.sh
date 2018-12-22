#!/bin/dash -ex
qemu-img create -f raw /home/glaucus/glaucus.img 128M
dd if=/usr/lib/syslinux/bios/mbr.bin of=/home/glaucus/glaucus.img conv=notrunc bs=440 count=1
parted -s /home/glaucus/glaucus.img mklabel msdos
parted -s -a none /home/glaucus/glaucus.img mkpart primary ext4 0 128M
parted -s -a none /home/glaucus/glaucus.img set 1 boot on
lodev=$(losetup -f)
losetup $lodev /home/glaucus/glaucus.img
partx -a $lodev
mkfs.ext4 ${lodev}p1
mount ${lodev}p1 /mnt/loop
rm -frv /mnt/loop/lost+found
fakeroot cp -arvP /home/glaucus/system/* /mnt/loop
mkdir -pv /mnt/loop/boot/extlinux
rsync -vah /home/glaucus/scripts/extlinux.conf /mnt/loop/boot/extlinux --delete
chown -vR root:root /mnt/loop/*
extlinux --install /mnt/loop/boot/extlinux
umount /mnt/loop
partx -d $lodev
losetup -d $lodev
