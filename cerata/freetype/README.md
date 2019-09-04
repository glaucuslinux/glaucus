# freetype

## Name
freetype

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://git.sv.nongnu.org/r/freetype/freetype2

## Cysts
* musl
* zlib
* libpng

## Description
A freely available software library to render fonts

## Licenses
* FTL
* GPLv2+
* MIT
* zlib

## Prepare
```shell
rsync -vah $CERD/$name/freetype2/ $SSRC/$name --delete
cd $SSRC/$name
```

## Configure
```shell
./autogen.sh
case $ceras in
  freetype_1)
    ZLIB_CFLAGS=-I$GLAD/usr/include \
    ZLIB_LIBS="-L$GLAD/usr/lib -lz" \
    BZIP2_CFLAGS=-I$GLAD/usr/include \
    BZIP2_LIBS="-L$GLAD/usr/lib -lbz2" \
    LIBPNG_CFLAGS=-I$GLAD/usr/include/libpng16 \
    LIBPNG_LIBS="-L$GLAD/usr/lib -lpng16 -lz" \
    ./configure \
      --prefix=/usr \
      --build=$TUPL \
      --host=$TUPL \
      --target=$TUPL \
      --disable-static \
      --with-sysroot=$GLAD \
      --with-zlib \
      --with-bzip2 \
      --with-png \
      --without-harfbuzz \
      --without-brotli \
      --without-old-mac-fonts \
      --without-fsspec \
      --without-fsref \
      --without-quickdraw-toolbox \
      --without-quickdraw-carbon \
      --without-ats
    ;;
  freetype_2)
    ZLIB_CFLAGS=-I$GLAD/usr/include \
    ZLIB_LIBS="-L$GLAD/usr/lib -lz" \
    BZIP2_CFLAGS=-I$GLAD/usr/include \
    BZIP2_LIBS="-L$GLAD/usr/lib -lbz2" \
    LIBPNG_CFLAGS=-I$GLAD/usr/include/libpng16 \
    LIBPNG_LIBS="-L$GLAD/usr/lib -lpng16 -lz" \
    HARFBUZZ_CFLAGS="-I$GLAD/usr/include/harfbuzz -I$GLAD/usr/include/glib-2.0 -I$GLAD/usr/lib/glib-2.0/include" \
    HARFBUZZ_LIBS="-L$GLAD/usr/lib -lharfbuzz" \
    ./configure \
      --prefix=/usr \
      --build=$TUPL \
      --host=$TUPL \
      --target=$TUPL \
      --disable-static \
      --with-sysroot=$GLAD \
      --with-zlib \
      --with-bzip2 \
      --with-png \
      --with-harfbuzz \
      --without-brotli \
      --without-old-mac-fonts \
      --without-fsspec \
      --without-fsref \
      --without-quickdraw-toolbox \
      --without-quickdraw-carbon \
      --without-ats
    ;;
esac
```

## Build
```shell
make
```

## Install
```shell
make \
  DESTDIR=$SCER/$ceras/sac \
  install
```
