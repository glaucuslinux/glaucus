#!/usr/bin/dash -ex

# Copyright (c) 2019, Firas Khalil Khana
# Distributed under the terms of the ISC License

GSCR=/home/glaucus/scripts

. $GSCR/variables
. $GSCR/cross/variables

. $GSCR/cross/clean

count=1
while true; do
  file=$count
  if [ -d $XLOG/$file ]; then count=$(($count + 1)); else break; fi
done

mkdir -v $XLOG/$file
(. $GSCR/cross/construct | tee $XLOG/$file/out.log) 3>&1 1>&2 2>&3 | tee \
  $XLOG/$file/err.log
