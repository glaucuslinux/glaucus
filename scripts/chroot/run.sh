#!/usr/bin/dash -ex

# Copyright (c) 2019, Firas Khalil Khana
# Distributed under the terms of the ISC License

GSCR=/home/glaucus/scripts

. $GSCR/variables
. $GSCR/chroot/variables

. $GSCR/chroot/clean
. $GSCR/chroot/prepare

count=1
while true; do
  file=$count
  if [ -d $CLOG/$file ]; then count=$(($count + 1)); else break; fi
done

mkdir -v $CLOG/$file
(. $GSCR/chroot/construct | tee $CLOG/$file/stdout.log) 3>&1 1>&2 2>&3 | tee \
  $CLOG/$file/stderr.log
