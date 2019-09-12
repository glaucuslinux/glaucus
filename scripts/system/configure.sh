#!/usr/bin/dash -ex

cd /home/glaucus/scripts/system/etc
install -vm 644 fstab group hosts passwd profile shells -t $GLAD/etc

# pipes/fifos can be copied, rsynced and tarred but can't be hashed, they also
# magically turn into regular files when using fakeroot (this must be related
# to using img files, but it's still magical)
cd $GLAD/etc/s6/run-image/service
mkfifo -m 0600 s6-linux-init-shutdownd/fifo s6-svscan-log/fifo
