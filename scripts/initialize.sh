#!/usr/bin/dash -e

# Copyright (c) 2019, Firas Khalil Khana
# Distributed under the terms of the ISC License

cd /home/glaucus

install -dv backup sources system toolchain

install -dv logs/chroot logs/system logs/toolchain/cross logs/toolchain/native

install -dv temporary/chroot/builds temporary/chroot/sources \
  temporary/system/builds temporary/system/cerata temporary/system/sources \
  temporary/toolchain/sources temporary/toolchain/cross/builds \
  temporary/toolchain/native/builds
