#!/usr/bin/dash -e

DEST=temporary/system/iso
RSYNC='/usr/bin/rsync -vaHAXSx'

cd /home/glaucus

install -dv $DEST

$RSYNC boot etc root usr var $DEST --delete

install -dv $DEST/images $DEST/isolinux $DEST/kernel

$RSYNC /usr/lib/syslinux/bios/isolinux.bin /usr/lib/syslinux/bios/ldlinux.c32 \
  $DEST/isolinux --delete
$RSYNC /usr/lib/syslinux/bios/memdisk $DEST/isolinux/kernel --delete

cat > $DEST/isolinux/isolinux.cfg << EOF
prompt 0
default glaucus
label glaucus
  kernel /boot/vmlinuz
  append root=/dev/sda1 rootfstype=iso9660 init=/etc/s6/bin/init ro
EOF
mkisofs -o glaucus.iso -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table $DEST
