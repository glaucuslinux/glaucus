# glaucus

glaucus is a highly optimized and extremely lightweight suckless Linux
distribution built from scratch.

It was previously known as snail, and has been under development for 2 years
now. It was initially intended for educational purposes, but it soon grew into
a project many would find interesting.

While it may seem as an embedded Linux distribution at first sight, it's
actually intended for regular `x86-64` desktop machines.

![_glaucus logo_](
https://github.com/firasuke/glaucus-artwork/blob/master/glaucus-logo.svg)

"glaucus-logo.svg" by Andy Cuccaro is licensed under CC-BY-SA-4.0


## Naming Convention

It's highly recommended that you refer to the [Naming Convention page on the
wiki](https://github.com/firasuke/glaucus/wiki/Naming-Convention) before further
reading.


## Features

glaucus boasts the following features:

* extremely lightweight, as the `core` installation only needs 25MB of disk
space and requires 33MB of RAM to boot in QEMU and idles at just under 6MB of
RAM

![lightweight](
https://github.com/firasuke/glaucus-screenshots/raw/master/lightweight.png)

* bleeding edge

* the building process (for glaucus and its toolchains) is entirely automated

* musl libc

* skarnet's latest s6 small supervision suite

* skarnet's latest s6-linux-init tools for a Linux init system

* skarnet's latest s6-rc service manager for s6 [(glaucus-s6-boot-scripts)](
https://github.com/firasuke/glaucus-s6-boot-scripts)

* toybox

* Portable OpenBSD `ksh` (`oksh`) as the main user shell (much lighter and
faster (around 2.5x) than `bash`, and still manages to support auto-completion
and command history).

* `dash` for running scripts (all system scripts are written in POSIX `dash`,
which is only 1.8x faster than `oksh`) (you can even replace run dash alone if
you're an adventurer, but glaucus tries to stay convenient while being extremely
lightweight)

* NetBSD's curses, with `less`, `mandoc` and `vim` all built against it

* LibreSSL

* And many more lightweight and suckless software (`mawk`, `byacc`, `re2c`,
`gettext-tiny`, `nnn`...)

* Adheres to the latest FHS standards, with a minimal and clean root filesystem

* The kernel uses the bare minimum configuration needed to get a bootable system
(from DOTSLASHLINUX's extremely lightweight kernel configuration guides)

* Doesn't require a separate partition to build and install into


## Optimizations

The `core` image builds (along with 130+ cerata) with really extreme
optimization flags such as:

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

* Link Time Optimization (LTO) (with working zstd support for future GCC
releases)

* Extra performance related optimizations


## Supported Architectures

Currently only `x86_64-pc-linux-musl` is supported with plans in the near future
to support other architectures like x86, ARM, Raspberry PI, RISC-V and PowerPC.


## Minimum Requirements

Based on initial observations with QEMU, it seems that glaucus won't boot
without having at least 33MB of RAM, even though it uses less than 6MB of RAM
when idle.


## Wiki

Kindly refer to the [wiki](https://github.com/firasuke/glaucus/wiki) for more
information regarding glaucus.

Please keep in mind that the wiki is nowhere near finished (I'd say it's at 15%
but that's just wishful thinking).


## Artwork and Screenshots

Kindly refer to [glaucus-artwork](https://github.com/firasuke/glaucus-artwork)
and [glaucus-screenshots](https://github.com/firasuke/glaucus-screenshots) 
respectively.

![_Tux Puffy glaucus_](
https://github.com/firasuke/glaucus-artwork/blob/master/Tux-Puffy-Glaucus.jpg)

"Tux-Puffy-Glaucus.jpg" by Andy Cuccaro is licensed under CC-BY-SA-4.0


## Voyager

Firas Khalil Khana (firasuke) <firasuke@gmail.com>


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
