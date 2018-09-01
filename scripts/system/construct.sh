#!/bin/dash -ex

prepare () {
	. /home/glaucus/scripts/variables
	. /home/glaucus/scripts/system/clean.sh

	assign_basic_variables
	assign_system_variables

	cd $GLAD
	mkdir -p bin boot dev etc lib proc sys tmp usr var/run

	install -d -m 0750 $GLAD/root

	cp $PRFX/$TRPL/lib64/libgcc_s.so.1 $GLAD/lib
	$STRIP $GLAD/lib/libgcc_s.so.1
}

construct () {
	for item in "$@"
	do
		. $CERD/$item/ceras
		build_system
	done
}

configure () {
cat > $GLAD/etc/passwd << EOF
root::0:0:root:/root/:/bin/ksh
EOF

cat > $GLAD/etc/group << EOF
root:x:0:
tty:x:1:
disk:x:2:
video:x:3:
EOF

cat > $GLAD/etc/fstab << EOF
/dev/sda1 / ext4 defaults 0 1
tmp /tmp tmpfs nosuid,noexec 0 0
EOF

cat > $GLAD/etc/hosts << EOF
127.0.0.1 glaucus
EOF

cat > $GLAD/bin/rc.init << EOF
#!/bin/sh

umask 022

/bin/mount -n -t proc -o nosuid,noexec,nodev proc /proc
/bin/mount -n -t sysfs -o nosuid,noexec,nodev sysfs /sys
/bin/mount -n -t tmpfs -o nosuid,mode=0755 dev /dev

/bin/mkdir /dev/pts
/bin/mount -n -t devpts -o gid=5,mode=0620 devpts /dev/pts

/bin/mount -o remount,ro /

echo /bin/smdev > /proc/sys/kernel/hotplug
/bin/smdev -s

cd /dev
/bin/ln -sf /proc/self/fd/0 stdin
/bin/ln -sf /proc/self/fd/1 stdout
/bin/ln -sf /proc/self/fd/2 stderr
/bin/ln -sf /proc/self/fd fd

cd - 1>/dev/null

/bin/mount -o remount,rw /
/bin/mount -a
/bin/ln -sf /proc/mounts /etc/mtab

/bin/hostname glaucus

/sbin/ip addr add 127.0.0.1/8 dev lo broadcast + scope host
/sbin/ip link set lo up

export TZ="Asia/Damascus"
/bin/hwclock -s -u /dev/rtc0
unset TZ

[ -f /etc/random-seed ] && /bin/cat /etc/random-seed >/dev/urandom
/bin/dd if=/dev/urandom of=/etc/random-seed count=1 bs=512 2>/dev/null

/bin/svc -s

: > /var/run/utmp

/bin/sh -c '/bin/respawn /bin/getty /dev/tty1 linux' &>/dev/null &
EOF

cat > $GLAD/bin/rc.shutdown << 'EOF'
#!/bin/sh

umask 022

/bin/stty onlcr

export TZ="Asia/Damascus"
/bin/hwclock -u -w /dev/rtc0
unset TZ

/bin/dd if=/dev/urandom of=/etc/random-seed count=1 bs=512 2>/dev/null

/bin/svc -k

/bin/killall5 -s TERM
/bin/killall5 -s KILL

/bin/mount -o remount,ro /
/bin/umount -a

/bin/sync

case "$1" in
	poweroff)
		/bin/halt -p
		;;

	reboot)
		/bin/halt -r
		;;
esac
EOF

cat > $GLAD/bin/poweroff << EOF
#!/bin/sh

/bin/kill -s USR1 1
EOF

cat > $GLAD/bin/reboot << EOF
#!/bin/sh

/bin/kill -s INT 1
EOF

	cd $GLAD/bin
	chmod 755 rc.init rc.shutdown poweroff reboot
}

prepare
construct musl
construct sbase ubase sinit smdev svc
construct dash loksh
construct bin86 lilo
construct linux
construct e2fsprogs
construct iproute2
configure

# . /home/glaucus/scripts/system/img.sh
