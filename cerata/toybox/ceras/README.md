# toybox

toybox replaces the following:
1. GNU Coreutils
2. Suckless Base (sbase)
3. Unportable Base (ubase)
4. OpenBSD userland port to Linux (lobase)
5. Util-Linux
6. Diffutils
7. Findutils
8. Grep
9. Sed
10. Patch

When compared to other tools, toybox lacks the following:

1. Suckless Base (sbase): `cols`, `join`, `pathchk`, `sha512-224um`,
`sha512-256um`, `sponge`, `tsort`, `unexpand` and `xinstall`

2. Unportable Base (ubase): `mesg` (not `dmesg`), `blkdiscard`, `ctrlaltdel`,
`lastlog`, `nologin`, `pagesize`, `respawn`, `swaplabel` and `vtallow`

3. GNU Coreutils: `dir`, `dircolors`, `vdir`, `b2sum`, `base32`, `csplit`,
`join`, `numfmt`, `ptx`, `pr`, `shuf`, `tsort`, `unexpand`, `pathchk`, `pinky`,
`stdbuf`, `users` and `[`

4. Diffutils: `diff3` and `sdiff`

5. Findutils: `locate` and `updatedb`

6. Util-Linux: `addpart`, `agetty`, `blkdiscard`, `blkzone`, `cfdisk`, `chcpu`,
`chfn`, `chmem`, `choom`, `chsh`, `col`, `colcrt`, `colrm`, `column`,
`ctrlaltdel`, `delpart`, `fdformat`, `findfs`, `findmnt`, `fsck.cramfs`,
`fsck.minix`, `fstrim`, `getopt`, `hardlink`, `hexdump`, `ipcmk`, `isosize`,
`idattach`, `look`, `lsblk`, `lscpu`, `lslocks`, `lslogins`, `lsmem`, `mesg`,
`mkfs` (legacy), `mkfs.bfs`, `mkfs.cramfs`, `mkfs.minix`, `namei`, `newgrp`,
`nologin`, `partx`, `pg` (legacy), `raw`, `readprofile`, `rename`, `resizepart`,
`rtcwake`, `runuser`, `script`, `scriptreplay`, `setarch`, `setpriv`, `setterm`,
`sfdisk`, `swaplabel`, `tailf` (legacy), `ul` (ulimit? if so it's included in
toybox), `utmpdump`, `uuidd`, `uuidgen`, `uuidparse`, `vipw`, `wall`, `wdctl`,
`whereis`, `wipefs`, `write` and `zramctl`

It also has the following turned off by default:

1. Suckless Base (sbase): `cron`, `expr`, `fold`, `libcrypto` (shasums), `tftp`
and `tr`

2. Unportable Base (ubase): `last`, `getty` and `dd`

3. GNU Coreutils: `chcon` (SELinux), `fold`, `tr`, `hostid` (example command),
`runcon` (SELinux) and `stty`

4. Diffutils: `diff`

5. Util-Linux: `fdisk`, `fsck`, `ipcrm`, `ipcs`, `last`, `more` and `sulogin`
