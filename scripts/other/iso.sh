#!/bin/sh -e

# Copyright (c) 2018-2020, Firas Khalil Khana
# Distributed under the terms of the ISC License

DEST=temporary/cross/iso &&
RSYNC='/usr/bin/rsync -vaHAXx' &&

cd /home/glaucus &&

$RSYNC $DEST &&

$RSYNC boot etc root usr var $DEST --delete &&

$RSYNC $DEST/images $DEST/isolinux $DEST/kernel &&

$RSYNC /usr/lib/syslinux/bios/isolinux.bin /usr/lib/syslinux/bios/ldlinux.c32 \
  $DEST/isolinux --delete &&
$RSYNC /usr/lib/syslinux/bios/memdisk $DEST/isolinux/kernel --delete &&

printf 'prompt 0
default glaucus
label glaucus
  kernel /boot/vmlinuz
  append root=/dev/sr0 rootfstype=iso9660 init=/etc/s6/bin/init ro quiet' > $DEST/isolinux/isolinux.cfg &&

mkisofs -o glaucus.iso -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -D -R $DEST
