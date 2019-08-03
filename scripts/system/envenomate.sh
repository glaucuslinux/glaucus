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
#envenomate sbase ubase lobase
#envenomate smdev nldev nlmon
#envenomate netbsd-curses procps dash loksh
#envenomate e2fsprogs
#envenomate linux
#envenomate skalibs execline s6 nsss utmps s6-linux-init s6-rc glaucus-s6-boot-scripts
#envenomate re2c
#envenomate sinit svc
#envenomate sdhcp
envenomate zlib #xz zlib libarchive
#envenomate pcre2 less mandoc vim
#envenomate file iproute2 opendoas libressl
#envenomate expat libffi wayland wayland-protocols
#envenomate jemalloc
#envenomate bin86 lilo
#envenomate s6-portable-utils s6-linux-utils
envenomate libpng pixman json-c cairo pango
