#!/usr/bin/dash -ex

envenomate() {
        for ceras in $@; do
                install -dv $SCER/$ceras/sac $SCER/$ceras/venom

                . $CERD/$(echo $ceras | sed s/_.//)/ceras
                build

                cd $SCER/$ceras/sac
                sudo sha512sum $(sudo tar cJvf ../venom/$name-$version-$release-$arch.tar.xz . | sed -e 's/\.\///' -e '/\/$/d' | sort) > ../venom/checksum
                tar xvf $SCER/$ceras/venom/$name-$version-$release-$arch.tar.xz -C $GLAD
                rsync -vah $SCER/$ceras/venom $GLAD/usr/cerata/$name --delete
        done
}

core='musl
        mawk_1 byacc mawk_2 
        skalibs execline s6 utmps
        sbase ubase lobase 
        smdev nldev nlmon
        netbsd-curses procps dash loksh
        e2fsprogs
        linux
        s6-linux-init s6-rc glaucus-s6-boot-scripts'

extra='re2c
        sinit svc
        sdhcp
        xz zlib libarchive
        pcre2 less mandoc vim
        file iproute2 opendoas libressl
        expat libffi wayland wayland-protocols
        jemalloc
        bin86 lilo
        nsss s6-portable-utils s6-linux-utils'

xorg='bzip2 zlib libpng freetype_1 libelf-compat pcre glib harfbuzz freetype_2 expat json-c fontconfig
        util-macros
        xorgproto libXau libXdmcp xcbproto libxcb
        libxtrans libX11 libXext libFS libICE libSM libXScrnSaver libXt libXmu libXpm libXaw libXfixes libXcomposite libXrender libXcursor libXdamage libfontenc libXfont libXft libXi libXinerama libXrandr libXRes libXtst libXv libXvMC libXxf86dga libXxf86vm libdmx libpciaccess libxkbfile libxshmfence
        libxcb-util libxcb-image libxcb-keysyms libxcb-render-util libxcb-wm libxcb-cursor
        pixman cairo
        fribidi libdatrie libthai pango'

envenomate $core
#envenomate $extra
#envenomate $xorg
