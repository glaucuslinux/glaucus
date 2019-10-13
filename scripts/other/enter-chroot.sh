#!/usr/bin/dash -ex

# Copyright (c) 2019, Firas Khalil Khana
# Distributed under the terms of the ISC License

sudo chroot /home/glaucus \
  /toolchain/bin/env -i \
  HOME=/root \
  PATH=/bin:/toolchain/bin \
  PS1="[\033[0;44mglaucus\033[0m:\033[1m\w\033[0m]$ " \
  TERM=xterm-256color \
  LD_LIBRARY_PATH=/toolchain/lib /toolchain/bin/loksh
