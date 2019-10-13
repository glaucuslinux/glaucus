#!/usr/bin/dash -ex

# Copyright (c) 2019, Firas Khalil Khana
# Distributed under the terms of the ISC License

. $CSCR/native/variables
. $CSCR/native/prepare
. $CSCR/native/log

(. $CSCR/construct | tee $CLOG/$log/out.log) 3>&1 1>&2 2>&3 | tee \
  $CLOG/$log/err.log

. $CSCR/native/clean
. $CSCR/native/root
. $CSCR/native/backup
