#!/usr/bin/dash -e

sudo umount -fR /home/glaucus/dev
sudo umount -fR /home/glaucus/proc
sudo umount -fR /home/glaucus/sys
sudo umount -fR /home/glaucus/run

sudo /usr/bin/rm -frv /home/glaucus/bin &&
sudo /usr/bin/rm -frv /home/glaucus/boot &&
sudo /usr/bin/rm -frv /home/glaucus/dev &&
sudo /usr/bin/rm -frv /home/glaucus/etc &&
sudo /usr/bin/rm -frv /home/glaucus/proc &&
sudo /usr/bin/rm -frv /home/glaucus/root &&
sudo /usr/bin/rm -frv /home/glaucus/run &&
sudo /usr/bin/rm -frv /home/glaucus/sys &&
sudo /usr/bin/rm -frv /home/glaucus/usr &&
sudo /usr/bin/rm -frv /home/glaucus/var &&
sudo /usr/bin/rm -frv /home/glaucus/tmp &&

sudo chown glaucus:glaucus /home/glaucus &&

[ -d /home/glaucus/backup/toolchain ] && sudo /usr/bin/rsync -vaHAXSxh /home/glaucus/backup/toolchain/ /home/glaucus/toolchain --delete
