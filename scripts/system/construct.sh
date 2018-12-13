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
construct sbase ubase lobase
construct sinit smdev svc
construct sdhcp
construct mawk byacc mawk re2c
construct dash
construct zlib xz libarchive
construct netbsd-curses loksh pcre2 less mandoc
construct e2fsprogs iproute2 file opendoas libressl
construct linux bin86 lilo
construct vim
construct skalibs execline s6-portable-utils s6-linux-utils s6 s6-linux-init
. /home/glaucus/scripts/system/configure.sh
# . /home/glaucus/scripts/system/img.sh
