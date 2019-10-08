#!/usr/bin/dash -ex

# Copyright (c) 2019, Firas Khalil Khana
# Distributed under the terms of the ISC License

# Although ARCH should be x86-64, some packages won't build successfully
# without x86_64, so the main approach is to use x86-64 whenever possible
# and switch to x86_64 once an error occurs
export ARCH=x86_64

# Decided to go with quadruplets for tuples,
# Replaced unknown with pc because it's shorter and more expressive
export TUPL=$ARCH-pc-linux-musl

# glaucus directory
export GLAD=/home/glaucus

# glaucus toolchain
export GLAT=/home/glaucus/toolchain

# cerata is for storing upstream sources and glaucus' recipe format
# logs contains log files for both System and Toolchain
# scripts contains all scripts
# temporary is where all the magic happens ;)
export CERD=$GLAD/cerata
export TLOG=$GLAD/logs/toolchain
export TSCR=$GLAD/scripts/toolchain
export TTMP=$GLAD/temporary/toolchain

# Where the sources reside away from upstream repo clones
export TSRC=$TTMP/sources

# The system wide symlink to the toolchain
export TOOL=/toolchain

# $CRSS should be searched first
# `/usr/bin/core_perl` resolves the pod2man related error until perl is added
export PATH=$TOOL/bin:/usr/bin:/usr/bin/core_perl

# It's highly recommended that MAKEFLAGS value stays at -j1 for now as any
# higher value might cause weird problems (segfaults included). 
export MAKEFLAGS=-j9

# Prepare for building
sudo rm -frv $TOOL $GLAT && install -dv $GLAT
sudo ln -fsv $GLAT $TOOL

# to ensure the sanity of the toolchain on x86-64 hosts before installation
ln -fsv lib $TOOL/lib64

# Build both cross and native (comment native to disable building it)
. $TSCR/cross/run
. $TSCR/native/run
