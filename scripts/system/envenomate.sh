#!/usr/bin/dash -ex
envenomate(){
        for item in $@
        do
                install -dv $SCER/$item/sac $SCER/$item/venom
                . $CERD/$item/ceras
                build
                cd $SCER/$item/sac
                sudo sha512sum $(sudo tar cJvf ../venom/$name-$version-$release-$arch.tar.xz . | sed -e 's/\.\///' -e '/\/$/d' | sort) > ../venom/checksum
                tar xvf $SCER/$name/venom/$name-$version-$release-$arch.tar.xz -C $GLAD
                rsync -vah $SCER/$name/venom $GLAD/usr/cerata/$name --delete
        done
}
envenomate musl
envenomate mawk byacc mawk
envenomate sbase ubase lobase
envenomate smdev nldev nlmon
envenomate netbsd-curses procps dash loksh
envenomate e2fsprogs
envenomate linux
envenomate skalibs execline s6 s6-linux-init s6-rc glaucus-s6-boot-scripts
#envenomate re2c \
        #sinit svc \
        #sdhcp \
        #xz zlib libarchive \
        #pcre2 less mandoc vim \
        #file iproute2 opendoas libressl \
        #expat libffi wayland wayland-protocols \
        #jemalloc \
        #bin86 lilo \
        #s6-portable-utils s6-linux-utils
