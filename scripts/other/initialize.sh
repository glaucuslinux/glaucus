#!/usr/bin/dash -ex

# Copyright (c) 2019, Firas Khalil Khana
# Distributed under the terms of the ISC License

cd /home/glaucus

mkdir -pv \
  logs/chroot \
  logs/cross \
  logs/system \
  logs/toolchain

mkdir -pv \
  chroot \
  cross \
  system \
  toolchain

mkdir -pv \
  temporary/chroot/builds \
  temporary/chroot/sources \
  temporary/cross/builds \
  temporary/cross/sources
  temporary/system/builds \
  temporary/system/cerata \
  temporary/system/sources \
  temporary/toolchain/builds \
  temporary/toolchain/sources
