#!/bin/dash -ex
#rsync -vah /home/glaucus/system /home/glaucus/temporary/system/iso --delete
#mkdir -v \
#        /home/glaucus/temporary/system/iso/isolinux \
#        /home/glaucus/temporary/system/iso/images \
#        /home/glaucus/temporary/system/iso/kernel
#chown -Rv root:root /home/glaucus/temporary/system/iso
#rsync -vah /usr/lib/syslinux/bios/isolinux.bin /home/glaucus/temporary/system/iso/isolinux --delete
#rsync -vah /usr/lib/syslinux/bios/ldlinux.c32 /home/glaucus/temporary/system/iso/isolinux --delete
#rsync -vah /usr/lib/syslinux/bios/memdisk /home/glaucus/temporary/system/iso/isolinux/kernel --delete
#cat > /home/glaucus/temporary/system/iso/isolinux/isolinux.cfg << EOF
#prompt 0
#default glaucus
#label glaucus
#	kernel /boot/vmlinuz
#	append root=/dev/sr0 rootfstype=iso9660 initrd=/boot/initramfs.igz init=/bin/sinit ro
#EOF
mkisofs -o /home/glaucus/glaucus.iso -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table /home/glaucus/temporary/system/iso
