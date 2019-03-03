#!/bin/dash -ex
envenomate(){
        for item in $@
        do
                install -dv $SCER/$item/sac $SCER/$item/venom
                . $CERD/$item/ceras
                build
                cd $SCER/$item/sac
                sudo sha512sum $(sudo tar cJvf ../venom/$name-$version-$release-$arch.tar.xz . | sed -e 's/\.\///' -e '/\/$/d' | sort) > ../venom/checksum
                tar xvf $SCER/$name/venom/$name-$version-$release-$arch.tar.xz -C $GLAD
                rsync -vah $SCER/$name/venom $GLAD/share/cerata/$name --delete
        done
}
envenomate musl \
        mawk byacc mawk \
        sbase ubase lobase \
        smdev nldev nlmon \
        netbsd-curses dash loksh \
        e2fsprogs \
        linux \
        skalibs execline s6 s6-linux-init s6-rc glaucus-s6-boot-scripts
#envenomate re2c \
        #sinit svc \
        #sdhcp \
        #xz zlib libarchive \
        #pcre2 less mandoc vim \
        #iproute2 file opendoas libressl \
        #bin86 lilo \
        #s6-portable-utils s6-linux-utils
