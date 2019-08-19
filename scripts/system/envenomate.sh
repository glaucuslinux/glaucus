#!/usr/bin/dash -ex
envenomate(){
        for item in $@
        do
                install -dv $SCER/$item/sac $SCER/$item/venom
                . $CERD/$(echo $item | sed s/_.//)/ceras
                build
                cd $SCER/$item/sac
                sudo sha512sum $(sudo tar cJvf ../venom/$name-$version-$release-$arch.tar.xz . | sed -e 's/\.\///' -e '/\/$/d' | sort) > ../venom/checksum
                tar xvf $SCER/$item/venom/$name-$version-$release-$arch.tar.xz -C $GLAD
                rsync -vah $SCER/$item/venom $GLAD/usr/cerata/$name --delete
        done
}
envenomate musl
envenomate mawk_1 byacc mawk_2
#envenomate sbase ubase lobase
#envenomate smdev nldev nlmon
#envenomate netbsd-curses procps dash loksh
#envenomate e2fsprogs
#envenomate linux
#envenomate skalibs execline s6 nsss utmps s6-linux-init s6-rc glaucus-s6-boot-scripts
#envenomate re2c
#envenomate sinit svc
#envenomate sdhcp
#envenomate xz zlib libarchive
#envenomate pcre2 less mandoc vim
#envenomate file iproute2 opendoas libressl
#envenomate expat libffi wayland wayland-protocols
#envenomate jemalloc
#envenomate bin86 lilo
#envenomate s6-portable-utils s6-linux-utils

#envenomate fribidi glib libpng pixman json-c cairo pango
#envenomate expat freetype_1 harfbuzz freetype_2 fontconfig fribidi libelf-compat pcre zlib glib libpng pixman json-c cairo pango
#envenomate libelf-compat pcre zlib glib
#envenomate zlib libpng libelf-compat pcre glib expat freetype_1 fontconfig harfbuzz freetype_2 fontconfig
#envenomate python

#envenomate libdatrie libthai zlib libpng pixman cairo expat freetype_1 harfbuzz freetype_2 fontconfig pango

#envenomate util-macros
#envenomate xorgproto libXau libXdmcp xcbproto libxcb
#envenomate zlib libpng freetype_1 expat fontconfig
#envenomate libxtrans libX11 libXext libFS libICE libSM libXScrnSaver libXt libXmu libXpm libXaw libXfixes libXcomposite libXrender libXcursor libXdamage libfontenc libXfont libXft libXi libXinerama libXrandr libXRes libXtst libXv libXvMC libXxf86dga libXxf86vm libdmx libpciaccess libxkbfile libxshmfence
#envenomate libxcb-util libxcb-util-image libxcb-keysyms libxcb-render-util libxcb-wm libxcb-cursor
envenomate pkgconf
