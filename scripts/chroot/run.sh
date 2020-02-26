#!/usr/bin/dash -e

# Copyright (c) 2019-2020, Firas Khalil Khana
# Distributed under the terms of the ISC License

. /home/glaucus/scripts/chroot/variables &&
. $CSCR/check &&
. $CSCR/prepare &&

$SCRD/log $CLOG $CSCR/construct &&

. $CSCR/clean
. $CSCR/root &&
. $CSCR/backup
. $CSCR/vkfs &&
. $CSCR/resolv &&

. $SCRD/system/check &&

. $CSCR/chroot
