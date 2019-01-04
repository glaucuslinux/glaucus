#!/bin/dash -ex
cat > $GLAD/etc/passwd << EOF
root::0:0:root:/root/:/bin/loksh
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
cat > $GLAD/bin/init << EOF
#!/bin/execlineb -P
/bin/s6-envdir /etc/s6/env
/bin/importas /bin /bin
/bin/export PATH /bin
cd /
emptyenv -p
s6-setsid -b
umask 022
if { s6-mount -nwt tmpfs -o mode=0755 tmpfs /run }
if { s6-hiercopy /etc/s6/run-image /run }
emptyenv -p
s6-envdir /etc/s6/env
redirfd -r 0 /dev/null
redirfd -wnb 1 /run/service/s6-svscan-log/fifo
background
{
        s6-setsid
        redirfd -w 1 /run/service/s6-svscan-log/fifo
        fdmove -c 2 1
        /etc/rc.init
}
unexport !
fdmove -c 2 1
s6-svscan -st0 /run/service
EOF
cat > $GLAD/etc/rc.init << EOF
#!/bin/execlineb -P
EOF
cat > $GLAD/etc/rc.shutdown << 'EOF'
#!/bin/execlineb -P
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
chmod 755 init rc.init rc.shutdown poweroff reboot
cat > $GLAD/etc/profile << 'EOF'
export PS1="[\033[0;44m\u@\h\033[0m:\033[1m\w\033[0m]$ "
export HISTFILE=$HOME.loksh_history
export PAGER=/bin/less
alias ls='ls -F'
EOF
cat > $GLAD/etc/shells << EOF
/bin/dash
/bin/ksh
/bin/loksh
/bin/sh
EOF
