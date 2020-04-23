# procps-ng

## System

### Configure
procps-ng 3.3.15 doesn't like gettext-tiny's autopoint that much:

<https://github.com/sabotage-linux/gettext-tiny/issues/25>

procps-ng 3.3.15 also doesn't like any aclocal above 1.15:

<https://bugs.gentoo.org/651036>

selinux is disabled by default (`--enable-libselinux=no` by default)
