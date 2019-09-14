#!/usr/bin/dash -ex

# Copyright (c) 2019, Firas Khalil Khana
# Distributed under the terms of the ISC License

cd /home/glaucus/chroot

sudo chroot . \
  bin/env -i \
  PATH=/bin \
  PS1="[\033[0;44mglaucus\033[0m:\033[1m\w\033[0m]$ " \
  TERM=xterm-256color \
  bin/loksh +h
