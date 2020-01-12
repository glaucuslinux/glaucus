#!/usr/bin/dash -e

# Copyright (c) 2019-2020, Firas Khalil Khana
# Distributed under the terms of the ISC License

. /scripts/system/variables
. $SSCR/prepare

$SCRD/log $SLOG $SSCR/construct

. $SSCR/adjust

$SCRD/log $SLOG $SSCR/envenomate

. $SSCR/configure
#. $SSCR/clean
