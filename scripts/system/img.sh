#!/usr/bin/dash -ex
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
rsync -vah /home/glaucus/system/ /mnt/loop --delete
install -Dv /home/glaucus/scripts/extlinux.conf -t /mnt/loop/boot/extlinux
chown -vR root:root /mnt/loop
extlinux --install /mnt/loop/boot/extlinux
umount /mnt/loop
partx -d $lodev
losetup -d $lodev
