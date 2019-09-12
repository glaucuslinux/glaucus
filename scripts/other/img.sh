#!/usr/bin/dash -ex
qemu-img create -f raw $1 $2
dd if=/usr/lib/syslinux/bios/mbr.bin of=$1 conv=notrunc bs=440 count=1
parted -s $1 mklabel msdos
parted -s -a none $1 mkpart primary ext4 0 $2
parted -s -a none $1 set 1 boot on
lodev=$(losetup -f)
losetup $lodev $1
partx -a $lodev
mkfs.ext4 ${lodev}p1
mount ${lodev}p1 /mnt/loop
rsync -vah /home/glaucus/system/ /mnt/loop --delete
install -Dv /home/glaucus/scripts/extlinux.conf -t /mnt/loop/boot/extlinux
chown -vR root:root /mnt/loop
extlinux --install /mnt/loop/boot/extlinux
umount /mnt/loop
partx -d $lodev
losetup -d $lodev
