#!/usr/bin/dash -ex

# Copyright (c) 2019, Firas Khalil Khana
# Distributed under the terms of the ISC License

cd /home/glaucus

mkdir -pv \
  chroot \
  cross \
  native \
  system

mkdir -pv \
  logs/chroot \
  logs/cross \
  logs/native \
  logs/system

mkdir -pv \
  temporary/chroot/builds \
  temporary/chroot/sources \
  temporary/cross/builds \
  temporary/cross/sources \
  temporary/native/builds \
  temporary/native/sources \
  temporary/system/builds \
  temporary/system/cerata \
  temporary/system/sources
