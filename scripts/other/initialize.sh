#!/usr/bin/dash -ex

# Copyright (c) 2019, Firas Khalil Khana
# Distributed under the terms of the ISC License

cd /home/glaucus

mkdir -pv \
  chroot \
  system \
  toolchain

mkdir -pv \
  logs/chroot \
  logs/system \
  logs/toolchain/cross \
  logs/toolchain/native

mkdir -pv \
  temporary/chroot/builds \
  temporary/chroot/sources \
  temporary/system/builds \
  temporary/system/cerata \
  temporary/system/sources \
  temporary/toolchain/sources \
  temporary/toolchain/cross/builds \
  temporary/toolchain/native/builds
