# glaucus
glaucus is a highly optimized and extremely lightweight suckless Linux
distribution built from scratch.

## Features
* musl libc
* suckless sbase + ubase
* OpenBSD lobase
* s6 init system
* s6-rc service manager
* latest developmental sources (gcc 10+, gmp developmental, mpfr, mpc)
* built with ISL and graphite optimizations enabled
* built with PGO and LTO

## Supported Architectures
* x86_64-pc-linux-musl

## Minimum Requirements
* 32 MB RAM (the actual requirement is much lower as it would perfectly run in
under 10MB of RAM, but that's qemu limit for you)
* qemu CPU

## Optimizations
glaucus utilizes a lot of optimizations that aim to provide better performance
without impacting the resulting packages size and memory footprint:

* -Ofast (and -O3 for packages that don't build with -Ofast)
* GCSE
* GRAPHITE (with latest ISL version)
* PGO (the 2 flags that PGO checks are enabled)
* SMS
* OpenMP (enabled on supported packages)
* IRA
* IPA
* LTO (with zstd compression, and falls back to zlib if zstd isn't possible)
* STRIP
* OTHERS

## Components
glaucus's core system is built up from the following main components:

* musl
* mawk
* byacc
* suckless sbase
* suckless ubase 
* lobase (the Linux port of OpenBSD base)
* suckless smdev
* suckless nldev
* suckless nlmon
* suckless nltrigger
* netbsd-curses
* procps (htop built with netbsd-curses)
* dash (for running scripts)
* loksh (the main user shell)
* e2fsprogs
* linux
* skalibs
* execline
* s6
* s6-linux-init (the newer versions > 1.0)
* s6-rc
* glaucus-s6-boot-scripts

## Extra Features
* LibreSSL
* re2c
* mandoc
* vim (built with netbsd-curses)
* wayland only (not sure how much of X11/Xorg is needed)

## Philosophy
* smallest
* simplest
* fastest
* most active
* most secure

## Naming Convention
Please refer to https://github.com/firasuke/glaucus/wiki/Naming-Convention

## Screenshots
* sub 5 or sub 10 MB RAM (plus earliest images of snail with 1-2 MB RAM)

## Artwork
* glaucus bennettae swimming with tux and openbsd fish in the ocean

## Wiki
* Installation instructions
* Either Binary or from Source (add march=native)

## Benchmarks
* vs Void Linux (runit, has s6 repo)
* vs Clear Linux
* vs Gentoo Linux (OpenRC)
* vs Crux Linux
* vs Adelie Linux (s6)
* vs Arch Linux
* vs Obarun Linux (s6)
* vs Alpine Linux

* vs morpheus
* vs stali
* vs Sabotage Linux

* Phoronix Test Suite

## Author
Firas Khalil Khana (firasuke@gmail.com)

## License
glaucus is licensed under the Internet Systems Consortium (ISC) license.
See LICENSE.

## Dedication
This project is dedicated to my parents for everything they've done and for
choosing to believe in me.

## Donations
* PayPal (firasuke@gmail.com)
* Patreon
