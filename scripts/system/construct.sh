#!/bin/dash -ex

construct () {
	for item in "$@"
	do
		. $CERD/$item/ceras
		build_system
	done
}

. /home/glaucus/scripts/system/prepare.sh
construct musl
construct sbase ubase lobase sinit smdev svc
construct dash loksh
construct mawk byacc re2c
construct zlib mandoc
construct e2fsprogs iproute2 file
construct bin86 lilo linux
. /home/glaucus/scripts/system/configure.sh

# . /home/glaucus/scripts/system/img.sh
