# toybox
*   toybox replaces the following:
*   GNU Coreutils
*   Suckless Base (sbase)
*   Unportable Base (ubase)
*   Heirloom Base (hbase)
*   OpenBSD userland port to Linux (lobase)
*   Util-Linux
*   Utilities Chest (UtilChest)
*   Diffutils
*   File
*   Findutils
*   Grep
*   Sed
*   Patch

When compared to other tools, toybox lacks the following:

*   Suckless Base (sbase): `cols`, `join`, `pathchk`, `sha512-224um`,
    `sha512-256um`, `sponge`, `tsort`, `unexpand` and `xinstall`

*   Unportable Base (ubase): `mesg` (not `dmesg`), `blkdiscard`, `ctrlaltdel`,
    `lastlog`, `nologin`, `pagesize`, `respawn`, `swaplabel` and `vtallow`

*   Heirloom Base (hbase): `banner`, `bdiff`, `bfs`, `build`, `calendar`, `col`,
    `copy`, `csplit`, `dc`, `deroff`, `diff3`, `dircmp`, `ed`, `fmtmsg`,
    `getopt`, `hd`, `listusers`, `mesg`, `nawk`, `news`, `oawk`, `pg`, `pr`,
    `priocntl`, `psrinfo`, `random`, `sdiff`, `setpgrp`, `shl`, `spell`, `sum`,
    `tabs`, `tapecntl`, `tcopy`, `tsort`, `ul`, `units`, `users`, `what` and
    `whodo`

*   GNU Coreutils: `dir`, `dircolors`, `vdir`, `b2sum`, `base32`, `csplit`,
    `join`, `numfmt`, `ptx`, `pr`, `shuf`, `tsort`, `unexpand`, `pathchk`,
    `pinky`, `stdbuf`, `users` and `[`

*   Diffutils: `diff3` and `sdiff`

*   Findutils: `locate` and `updatedb`

*   Util-Linux: `addpart`, `agetty`, `blkdiscard`, `blkzone`, `cfdisk`, `chcpu`,
    `chfn`, `chmem`, `choom`, `chsh`, `col`, `colcrt`, `colrm`, `column`,
    `ctrlaltdel`, `delpart`, `fdformat`, `findfs`, `findmnt`, `fsck.cramfs`,
    `fsck.minix`, `fstrim`, `getopt`, `hardlink`, `hexdump`, `ipcmk`, `isosize`,
    `idattach`, `look`, `lsblk`, `lscpu`, `lslocks`, `lslogins`, `lsmem`,
    `mesg`, `mkfs` (legacy), `mkfs.bfs`, `mkfs.cramfs`, `mkfs.minix`, `namei`,
    `newgrp`, `nologin`, `partx`, `pg` (legacy), `raw`, `readprofile`, `rename`,
    `resizepart`, `rtcwake`, `runuser`, `script`, `scriptreplay`, `setarch`,
    `setpriv`, `setterm`, `sfdisk`, `swaplabel`, `tailf` (legacy), `ul` (ulimit?
    if so it's included in toybox), `utmpdump`, `uuidd`, `uuidgen`, `uuidparse`,
    `vipw`, `wall`, `wdctl`, `whereis`, `wipefs`, `write` and `zramctl`

*   Utilities Chest (UtilChest): `pathchk`

It also has the following turned off by default (mostly pending):

*   Suckless Base (sbase): `cron`, `expr`, `fold`, `libcrypto` (shasums), `tftp`
    and `tr`

*   Unportable Base (ubase): `last`, `getty` and `dd`

*   Heirloom Base (hbase): `bc`

*   GNU Coreutils: `chcon` (SELinux), `fold`, `tr`, `hostid` (example command),
    `runcon` (SELinux) and `stty`

*   Diffutils: `diff`

*   Util-Linux: `fdisk`, `fsck`, `ipcrm`, `ipcs`, `last`, `more` and `sulogin`

## Configure
toybox's `ls` outputs in the `long-iso` time style, which isn't compatible with
some scripts like `build-aux/mdate-sh` which many packages (especially GNU ones)
use, therefore a `%b` was added prior to `%F` to fix this problem.

The difference between chroot toybox and system toybox is that chroot toybox
uses the internally provided libz and libcrypto to prevent messing with the
LD_LIBRARY_PATH variables when building chroot and system, while system toybox
relies on the system installed zlib-ng and libressl to provide better and faster
support.

Also chroot toybox has hostname built into it to satisfy cerata that require it
(e.g. m4), while system toybox doesn't as `hostname` from debian is used.

## Build
Building toybox with any of the flags `-fno-common`, `-flto` and
`-malign-data=cacheline` causes weird `autoconf` output which makes cerata that
require running `autoreconf` (which includes running `autoconf`) to fail with
the weird m4 Error:
```C
autoreconf: Entering directory `.'
autoreconf: configure.ac: not using Gettext
autoreconf: running: aclocal --force -I m4
autoreconf: configure.ac: tracing
autoreconf: configure.ac: not using Libtool
autoreconf: running: /usr/bin/autoconf --force
autoreconf: configure.ac: not using Autoheader
autoreconf: configure.ac: not using Automake
autoreconf: Leaving directory `.'
configure: WARNING: libattr development library was not found or not usable.
configure: WARNING: GNU patch will be built without xattr support.
m4:/tmp/am4tJkeFDJ/traces.m4:293: ERROR: end of file in argument list
configure.ac: error: no proper invocation of AM_INIT_AUTOMAKE was found.
configure.ac: You should verify that configure.ac invokes AM_INIT_AUTOMAKE,
configure.ac: that aclocal.m4 is present in the top-level directory,
configure.ac: and that aclocal.m4 was recently regenerated (using aclocal)
automake-1.16: error: no 'Makefile.am' found for any configure output
automake-1.16: Did you forget AC_CONFIG_FILES([Makefile]) in configure.ac?
make: *** [Makefile:1231: Makefile.in] Error 1
```

# Native
## Configure
Don't disable who and whoami (and utmp/utmpx) because it will cause autotools
to break again (like the m4 error end of file in string...).
