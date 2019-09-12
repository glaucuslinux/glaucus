#!/usr/bin/dash -ex

envenomate() {
  for ceras in $@; do
    echo Creating directories for $ceras
    install -dv $SCER/$ceras/sac $SCER/$ceras/venom

    echo Sourcing $ceras ceras
    . $CERD/$(echo $ceras | sed s/_.//)/ceras
    prepare_system && configure_system && build_system && install_system

    echo Creating $ceras tarball
    cd $SCER/$ceras/sac
    sudo sha512sum $(sudo tar cJvf \
      ../venom/$name-$version-$release-$arch.tar.xz . | sed -e 's/\.\///' -e \
      '/\/$/d' | sort) > ../venom/checksum
    tar xvf $SCER/$ceras/venom/$name-$version-$release-$arch.tar.xz -C $GLAD

    rsync -vah $SCER/$ceras/venom $GLAD/usr/cerata/$name --delete
  done
}

# core
#
# It's easier and quicker to edit separate calls of envenomate that to edit a
# variable holding its arguments or split the arguments into multiple lines
envenomate musl
envenomate mawk_1 byacc mawk_2
envenomate skalibs execline s6 utmps
envenomate sbase ubase lobase
envenomate smdev nldev nlmon
envenomate netbsd-curses procps dash loksh
envenomate e2fsprogs
envenomate linux
envenomate s6-linux-init s6-rc glaucus-s6-boot-scripts

# extra
#
# s6-linux-utils needs to be built before nsss or it'll error out with undefined
# references to `nsss_all_getgrgid` and `nsss_all_getpwuid`
#envenomate re2c
#envenomate sinit svc
#envenomate sdhcp
#envenomate bzip2 xz zlib libarchive
#envenomate pcre2 less mandoc vim
#envenomate file iproute2 opendoas libressl
#envenomate expat libffi wayland wayland-protocols
#envenomate jemalloc
#envenomate bin86 lilo
#envenomate s6-linux-utils s6-portable-utils nsss

# xorg
#envenomate bzip2 zlib libpng freetype_1 libelf-compat pcre glib harfbuzz freetype_2 expat json-c fontconfig
#envenomate util-macros
#envenomate xorgproto libXau libXdmcp xcbproto libxcb
#envenomate libxtrans libX11 libXext libFS libICE libSM libXScrnSaver libXt libXmu libXpm libXaw libXfixes libXcomposite libXrender libXcursor libXdamage libfontenc libXfont libXft libXi libXinerama libXrandr libXRes libXtst libXv libXvMC libXxf86dga libXxf86vm libdmx libpciaccess libxkbfile libxshmfence
#envenomate libxcb-util libxcb-image libxcb-keysyms libxcb-render-util libxcb-wm libxcb-cursor
#envenomate pixman cairo
#envenomate fribidi libdatrie libthai pango
