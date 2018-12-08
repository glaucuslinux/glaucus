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
construct zlib xz libarchive
construct dash
construct netbsd-curses loksh pcre2 less mandoc
construct e2fsprogs iproute2 file opendoas libressl
construct linux bin86 lilo
construct vim
construct skalibs execline s6
. /home/glaucus/scripts/system/configure.sh

# . /home/glaucus/scripts/system/img.sh
