#!/bin/dash -ex
cd /home/glaucus/scripts/system/etc
install -vm 644 fstab group hosts passwd profile shells -t $GLAD/etc
