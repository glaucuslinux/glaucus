#!/bin/dash -ex
construct(){
        for item in "$@"
        do
                . $CERD/$item/ceras
                build
        done
}
construct musl
construct mawk byacc mawk re2c
construct sbase ubase lobase
construct sinit smdev svc
construct sdhcp
construct dash
construct zlib xz libarchive
construct netbsd-curses loksh pcre2 less mandoc
construct e2fsprogs iproute2 file opendoas libressl
construct linux bin86 lilo
construct vim
construct skalibs execline s6-portable-utils s6-linux-utils s6 s6-linux-init s6-rc
