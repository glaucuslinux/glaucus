# glaucus

glaucus is a highly optimized and extremely lightweight suckless Linux
distribution built from scratch.

It was previously known as snail, and has been under development for 2 years
now.

While it may seem as an embedded Linux distribution at first sight, it's
actually intended for regular `x86-64` desktop machines.


## Naming Convention

It's highly recommended that you refer to the [Naming Convention page on the
wiki](https://github.com/firasuke/glaucus/wiki/Naming-Convention)


## Features

glaucus has the following features:

* a suckless Linux distribution

* dynamically linked (perhaps the only thing that goes against the suckless
philosophy)

* uses musl libc

* replaced GNU Core Utilities with:
1. suckless base (sbase)
2. unportable base (ubase)
3. OpenBSD userland port to Linux (lobase)

* skarnet's s6 init system (with s6-linux-init version > 1.0)

* skarnet's s6-rc service manager

* uses the latest available upstream sources for all cerata

* built with the dangerous `Ofast` (this is only listed for bragging rights and
to show that glaucus is capable of building with `Ofast`; however, it's highly
recommended that you stick to `O2`, `Os` or even `O3` as executables behave
weirdly and unexpectedly with `Ofast`. How dangerous you might ask? Imagine
starting your machine, and seeing your trustworthy bootloader, the one that was
always working until you recently decided to compile it with `Ofast`, failing
to recognize any operating system previously installed on your machine...)

* uses Link Time Optimization (LTO) (with zstd set as default compression
method, and zlib set as a fallback method)

* has Graphite Loop Optimizations (ISL)

* has OpenMP on supported cerata

* 150+ packages building successfully with extreme configuration variables


## Supported Architecture

Currently only `x86_64-pc-linux-musl` is supported with no plans in the near
future to support any other architecture.

ARM support might be added in the distant future though.


## Minimum Requirements

Based on initial observations with QEMU, it seems that glaucus won't boot
without having at least 36MB of RAM, even though it uses less than 6MB of RAM
when idle.


## Wiki

Kindly refer to the [wiki](https://github.com/firasuke/glaucus/wiki) for more
information regarding glaucus.

Please keep in mind that the wiki is nowhere near finished (I'd say it's at 10%
but that's just wishful thinking).


## Inspired from

glaucus took inspiration from the following projects:

* [Aboriginal Linux](http://landley.net/aboriginal/)

* [Adelie Linux](https://www.adelielinux.org)

* [agunix](https://drewdevault.com/2017/05/05/Building-a-real-Linux-distro.html)

* [Alpine Linux](https://alpinelinux.org)

* [Arch Linux](https://www.archlinux.org)

* [Artix Linux](https://artixlinux.org)

* [Automated Linux From Scratch (ALFS)](http://linuxfromscratch.org/alfs/)

* [Baserock Linux](https://wiki.baserock.org/)

* [Beyond Linux From Scratch (BLFS)](http://linuxfromscratch.org/blfs/)

* [Beyond Musl Linux From Scratch (BMLFS)](https://github.com/dslm4515/BMLFS)

* [Buildroot](https://buildroot.org)

* [Build Your Own Linux](http://www.buildyourownlinux.com)

* [Cross-Compiled Linux From Scratch (CLFS)](https://trac.clfs.org)

* [Crosstool-NG](http://crosstool-ng.github.io)

* [Crux Linux](https://crux.nu)

* [Dragora GNU/Linux-Libre](https://www.dragora.org/en/index.html)

* [EasyOS](https://easyos.org)

* [Embedded Linux](https://elinux.org/Main_Page)

* [Funtoo Linux](https://www.funtoo.org/Welcome)

* [Gentoo Linux](https://gentoo.org)

* [Intel's Clear Linux OS](https://clearlinux.org)

* [KISS] (https://getkiss.org)

* [Linux From Scratch (LFS)](http://linuxfromscratch.org)

* [Mere Linux](https://github.com/jhuntwork/merelinux)

* [Metta OS](https://github.com/metta-systems/metta)

* [Morpheus Linux](morpheus.2f30.org)

* [Musl Linux From Scrath (MLFS)](https://github.com/dslm4515/Musl-LFS)

* [NetBSD](http://netbsd.org)

* [noname linux](https://github.com/xhebox/noname-linux)

* [Obarun Linux](https://web.obarun.org)

* [OpenBSD](https://www.openbsd.org)

* [OpenWrt](https://openwrt.org)

* [rlsd2](http://rlsd2.dimakrasner.com/)

* [rv8.io](https://github.com/rv8-io)

* [static linux (stali)](http://sta.li)

* [Sabotage Linux](http://sabo.xyz)

* [solyste](https://ywstd.fr/solyste/)

* [trinity](https://notabug.org/rain1/trinity)

* [Venom Linux](https://github.com/venomlinux)

* [Void Linux](https://voidlinux.org)


## Author

Firas Khalil Khana (firasuke@gmail.com)


## License

glaucus is licensed under the Internet Systems Consortium (ISC) license.
See LICENSE.


## Dedication

This project is dedicated to my lovely parents.


## Donations

If you like glaucus and want to support its development, then kindly donate to:
* PayPal (firasuke@gmail.com)
* Patreon (yet to come)

Hardware donations are also accepted.
