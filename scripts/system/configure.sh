#!/usr/bin/dash -ex
cd /home/glaucus/scripts/system/etc
install -vm 644 fstab group hosts passwd profile shells -t $GLAD/etc
mkfifo -m 0600 $GLAD/etc/s6/run-image/service/s6-linux-init-shutdownd/fifo $GLAD/etc/s6/run-image/service/s6-svscan-log/fifo
