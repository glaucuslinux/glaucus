#!/usr/bin/dash -ex

# Copyright (c) 2019, Firas Khalil Khana
# Distributed under the terms of the ISC License

GSCR=/home/glaucus/scripts

. $GSCR/variables
. $GSCR/toolchain/variables

. $GSCR/toolchain/clean

count=1
while true; do
  file=$count
  if [ -d $TLOG/$file ]; then count=$(($count + 1)); else break; fi
done

mkdir -v $TLOG/$file
(. $GSCR/toolchain/construct | tee $TLOG/$file/out.log) 3>&1 1>&2 2>&3 | tee \
  $TLOG/$file/err.log
