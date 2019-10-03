#!/usr/bin/dash -ex

# Copyright (c) 2019, Firas Khalil Khana
# Distributed under the terms of the ISC License

GSCR=/home/glaucus/scripts

. $GSCR/variables
. $GSCR/native/variables

. $GSCR/native/clean
. $GSCR/native/prepare

count=1
while true; do
  file=$count
  if [ -d $NLOG/$file ]; then count=$(($count + 1)); else break; fi
done

mkdir -v $NLOG/$file
(. $GSCR/native/construct | tee $NLOG/$file/out.log) 3>&1 1>&2 2>&3 | tee \
  $NLOG/$file/err.log
