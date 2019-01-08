#!/bin/dash -ex
cd /home/glaucus/scripts/system/etc
install -vm 644 fstab group hosts passwd profile shells -t $GLAD/etc
sudo install -v s6/rc.init s6/rc.shutdown -t $GLAD/etc/s6
