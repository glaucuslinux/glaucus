#!/bin/dash -ex

. /home/glaucus/scripts/variables
assign_basic_variables

cd $TMPD/system/sources/opendoas
AR=$AR CC=$CC YACC=$GLAD/bin/yacc CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS" make DESTDIR=$GLAD install
rm -rfv $GLAD/usr

. /home/glaucus/scripts/system/img.sh
