#!/bin/dash -ex

qemu-img create -f raw /home/glaucus/glaucus.img 128M
sudo dd if=/usr/lib/syslinux/bios/mbr.bin of=/home/glaucus/glaucus.img conv=notrunc bs=440 count=1
parted -s /home/glaucus/glaucus.img mklabel msdos
parted -s -a none /home/glaucus/glaucus.img mkpart primary ext4 0 128M
parted -s -a none /home/glaucus/glaucus.img set 1 boot on

lodev=$(losetup -f)
sudo losetup $lodev /home/glaucus/glaucus.img
sudo partx -a $lodev
sudo mkfs.ext4 ${lodev}p1

sudo mount ${lodev}p1 /mnt/loop
sudo rm -rf /mnt/loop/lost+found

fakeroot cp -arvP /home/glaucus/system/* /mnt/loop
sudo mkdir -p /mnt/loop/boot/extlinux
sudo cp /home/glaucus/scripts/extlinux.conf /mnt/loop/boot/extlinux/
chown -R root:root /mnt/loop/*

sudo extlinux --install /mnt/loop/boot/extlinux/

sudo umount /mnt/loop

sudo partx -d $lodev
sudo losetup -d $lodev
