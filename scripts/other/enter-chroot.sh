#!/usr/bin/dash -ex

# Copyright (c) 2019, Firas Khalil Khana
# Distributed under the terms of the ISC License

sudo \
  LD_LIBRARY_PATH=/toolchain/lib \
  chroot /home/glaucus \
  /toolchain/usr/bin/env -i \
  HOME=/root \
  PATH=/toolchain/bin:/toolchain/sbin:/toolchain/usr/bin:/toolchain/usr/sbin \
  PS1="[\033[0;44mglaucus\033[0m:\033[1m\w\033[0m]$ " \
  TERM=xterm-256color \
  LD_LIBRARY_PATH=/toolchain/lib /toolchain/bin/ksh
