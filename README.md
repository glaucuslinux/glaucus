# glaucus

glaucus is a highly optimized and extremely lightweight Linux distribution built
from scratch.

It was previously known as snail, and has been under development for 2 years
now.

While it may seem as an embedded Linux distribution at first sight, it's
actually intended for regular `x86-64` desktop machines.


## Naming Convention

It's highly recommended that you refer to the [Naming Convention page on the
wiki](https://github.com/firasuke/glaucus/wiki/Naming-Convention) before further
reading.


## Features

glaucus boasts the following features:

* extremely lightweight, as the `core` installation only needs 25MB of disk
space and requires 33MB of RAM to boot in QEMU and idles at just under 6MB of
RAM

* bleeding edge as it fetches the latest sources available from upstream
repositories for all cerata

* musl libc

* skarnet's s6 small supervision suite

* skarnet's s6-linux-init tools for a Linux init system (version 1.0.3)

* skarnet's s6-rc service manager for s6

* replaced GNU Core Utilities with:
  1. suckless base (sbase)
  2. unportable base (ubase)
  3. OpenBSD userland port to Linux (lobase)

* OpenMP

* `Ofast` (this is only listed for bragging rights and to show that glaucus is
capable of building with `Ofast`; however, it's highly recommended that you
stick to `O2`, `Os` or even `O3` as executables behave weirdly and unexpectedly
with `Ofast`. How dangerous you might ask? Imagine starting your machine, and
seeing your trustworthy bootloader, the one that was always working until you
recently decided to compile it with `Ofast`, failing to recognize any operating
system previously installed on your machine...)

* Swing Modulo Scheduling (SMS)

* Global Common Subexpression Elimination (GCSE)

* Integrated Register Allocation (IRA)

* Interprocedural Pointer Analysis (IPA)

* Graphite Loop Optimizations (ISL)

* Link Time Optimization (LTO) (with zstd set as default compression method, and
zlib set as a fallback method)

* Extra performance related optimizations

* 150+ packages building successfully

* doesn't require a separate partition to build and install into

* doesn't require a chroot to build correctly (hopefully this won't change when
working on the graphics stack)


## Supported Architectures

Currently only `x86_64-pc-linux-musl` is supported with no plans in the near
future to support any other architecture.

ARM, Raspberry Pi and RISC-V support might be added in the distant future
though.


## Minimum Requirements

Based on initial observations with QEMU, it seems that glaucus won't boot
without having at least 36MB of RAM, even though it uses less than 6MB of RAM
when idle.


## Wiki

Kindly refer to the [wiki](https://github.com/firasuke/glaucus/wiki) for more
information regarding glaucus.

Please keep in mind that the wiki is nowhere near finished (I'd say it's at 10%
but that's just wishful thinking).


## Artwork and Screenshots

Kindly refer to the
[Artwork wiki page](https://github.com/firasuke/glaucus/wiki/Artwork) for
glaucus related artwork.

Kindly refer to the
[Screenshots wiki page](https://github.com/firasuke/glaucus/wiki/Screenshots)
for screenshots of glaucus in action.


## Inspired from

glaucus is heavily inspired by the following projects:

* [Aboriginal Linux](http://landley.net/aboriginal/)

* [Adelie Linux](https://www.adelielinux.org)

* [agunix](https://drewdevault.com/2017/05/05/Building-a-real-Linux-distro.html)

* [Alpine Linux](https://alpinelinux.org)

* [Alpine-S6](https://github.com/woahbase/alpine-s6)

* [android-toolchain-build](https://github.com/redstar3894/android-toolchain-build)

* [Arch Linux](https://www.archlinux.org)

* [ARM Cross Linux From Scratch (arm-clfs)](https://github.com/predominant/arm-clfs)

* [Artix Linux](https://artixlinux.org)

* [Automated Linux From Scratch (ALFS)](http://linuxfromscratch.org/alfs/)

* [Bare Linux](https://github.com/uggedal/bare)

* [Baserock Linux](https://wiki.baserock.org/)

* [Bedrock Linux](https://bedrocklinux.org)

* [Beyond Linux From Scratch (BLFS)](http://linuxfromscratch.org/blfs/)

* [Beyond Musl Linux From Scratch (BMLFS)](https://github.com/dslm4515/BMLFS)

* [bleeding-edge-toolchain](https://github.com/FreddieChopin/bleeding-edge-toolchain)

* [B/LFS-s6](https://www.linuxquestions.org/questions/linux-from-scratch-13/%5Bannoucement%5D-b-lfs-s6-project-4175510228/)

* [Bluedragon](https://wiki.gentoo.org/wiki/Project:Hardened_musl/Bluedragon)

* [build-linux](https://github.com/MichielDerhaeg/build-linux)

* [Buildroot](https://buildroot.org)

* [Build Your Own Linux](http://www.buildyourownlinux.com)

* [Cavium](https://github.com/Cavium-Open-Source-Distributions)

* [Clear Linux OS](https://clearlinux.org)

* [clfs-arm](https://github.com/LeeKyuHyuk/clfs-arm)

* [Cross-Compiled Linux From Scratch (CLFS)](https://trac.clfs.org)

* [Crosstool-NG](http://crosstool-ng.github.io)

* [Crux Linux](https://crux.nu)

* [Dragora GNU/Linux-Libre](https://www.dragora.org/en/index.html)

* [EasyOS](https://easyos.org)

* [ELLCC](http://ellcc.org)

* [Embedded Linux](https://elinux.org)

* [Funtoo Linux](https://www.funtoo.org/Welcome)

* [Gentoo Linux](https://gentoo.org)

* [GentooLTO](https://github.com/InBetweenNames/gentooLTO)

* [gentoo-s6-services](https://github.com/rain-1/gentoo-s6-services)

* [Glendix](http://www.glendix.org/)

* [GoboLinux](https://gobolinux.org)

* [KISS](https://getkiss.org)

* [LFS-s6](https://github.com/djlucas/LFS-s6)

* [lh-bootstrap](https://skarnet.org/software/lh-bootstrap)

* [lightcube-bootstrap-musl](https://github.com/jhuntwork/lightcube-bootstrap-musl)

* [Linaro](https://www.linaro.org)

* [Linux From Scratch (LFS)](http://linuxfromscratch.org)

* [Mere Linux](https://github.com/jhuntwork/merelinux)

* [Metta OS](https://github.com/metta-systems/metta)

* [Minimal Linux Live (MLL)](http://minimal.idzona.com)

* [mkroot](https://github.com/landley/mkroot)

* [Morpheus Linux](morpheus.2f30.org)

* [musl-cross](https://github.com/GregorR/musl-cross)

* [musl-cross-make](https://github.com/richfelker/musl-cross-make)

* [Musl-LFS-s6-Bootscripts](https://github.com/dslm4515/MLFS-S6-Bootscripts)

* [Musl Linux From Scrath (MLFS)](https://github.com/dslm4515/Musl-LFS)

* [NetBSD](http://netbsd.org)

* [noname linux](https://github.com/xhebox/noname-linux)

* [Obarun Linux](https://web.obarun.org)

* [obarun-s6rcserv](https://github.com/Obarun/obarun-s6rcserv)

* [obarun-s6serv](https://github.com/Obarun/obarun-s6serv)

* [OpenBSD](https://www.openbsd.org)

* [OpenWrt](https://openwrt.org)

* [OSDev](https://wiki.osdev.org)

* [Prelinux](https://github.com/mikejsavage/prelinux)

* [pts-tcc](https://github.com/pts/pts-tcc)

* [rc](https://github.com/smaeul/rc)

* [rc-user](https://github.com/smaeul/rc-user)

* [rlsd2](http://rlsd2.dimakrasner.com/)

* [rv8.io](https://github.com/rv8-io)

* [s6-boot](https://github.com/Obarun/s6-boot)

* [s6-overlay](https://github.com/just-containers/s6-overlay)

* [Sabotage Linux](http://sabo.xyz)

* [solyste](https://ywstd.fr/solyste/)

* [Spark](https://fleshless.org/pages/spark.html)

* [static linux (stali)](http://sta.li)

* [tomsrtbt](http://www.toms.net/rb/)

* [trinity](https://notabug.org/rain1/trinity)

* [Venom Linux](https://github.com/venomlinux)

* [Void Linux](https://voidlinux.org)

* [Yocto Project](https://www.yoctoproject.org)

* [ZYDUX](https://github.com/rom1nux/zydux-forge)


## Author

Firas Khalil Khana (firasuke@gmail.com)


## License

glaucus is licensed under the Internet Systems Consortium (ISC) license.
See LICENSE.


## Dedication

This project is dedicated to my lovely parents.


## Donations

If you like glaucus and want to support its development, then kindly donate to:

* [Patreon](https://www.patreon.com/firasuke)

* [Liberapay](https://liberapay.com/firasuke)

* [Ko-fi](https://ko-fi.com/firasuke)

* [Flattr](https://flattr.com/@firasuke)

* PayPal: firasuke@gmail.com

Hardware donations are also accepted.
