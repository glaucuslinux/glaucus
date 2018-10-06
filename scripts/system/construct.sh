#!/bin/dash -ex

construct () {
	for item in "$@"
	do
		. $CERD/$item/ceras
		build
	done
}

. /home/glaucus/scripts/system/prepare.sh
construct musl
construct sbase ubase lobase sinit smdev svc sdhcp
construct mawk byacc re2c
construct dash loksh
construct zlib xz libarchive
construct netbsd-curses pcre2 less mandoc
construct e2fsprogs iproute2 file opendoas
construct bin86 lilo linux
. /home/glaucus/scripts/system/configure.sh

# . /home/glaucus/scripts/system/img.sh
