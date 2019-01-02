#!/bin/dash -ex
envenomate(){
        for item in $@
        do
                install -dv $SCER/$item/sac $SCER/$item/venom
                . $CERD/$item/ceras
                build
                cd $SCER/$item/sac
                sha512sum $(tar cJvf ../venom/$name-$version-$release-$arch.tar.xz * | sed '/\/$/d' | sort) > ../venom/checksum
                tar xvf $SCER/$name/venom/$name-$version-$release-$arch.tar.xz -C $GLAD
                rsync -vah $SCER/$name/venom $GLAD/share/cerata/$name --delete
        done
}
#envenomate musl \
        #mawk byacc mawk re2c \
        #sbase ubase lobase \
        #sinit smdev svc \
        #sdhcp \
        #netbsd-curses dash loksh \
        #xz zlib libarchive \
        #pcre2 less mandoc vim \
        #e2fsprogs iproute2 file opendoas libressl \
        #linux bin86 lilo \
        #skalibs execline s6-portable-utils s6-linux-utils s6 s6-linux-init s6-rc
envenomate musl mawk libressl
