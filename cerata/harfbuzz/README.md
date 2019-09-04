# harfbuzz

## Name
harfbuzz

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://github.com/harfbuzz/harfbuzz

## Cysts
* musl
* freetype

## Description
A text shaping engine

## Licenses
* Apachev2.0
* GPLv2+
* GPLv3+
* ICU
* ISC
* MIT
* OFLv1.1

## Prepare
```shell
rsync -vah $CERD/$name/$name $SSRC --delete
cd $SSRC/$name
```

## Configure
```shell
GLIB_CFLAGS="-I$GLAD/usr/include/glib-2.0 -I$GLAD/usr/lib/glib-2.0/include" \
GLIB_LIBS="-L$GLAD/usr/lib -lglib-2.0" \
FREETYPE_CFLAGS=-I$GLAD/usr/include/freetype2 \
FREETYPE_LIBS="-L$GLAD/usr/lib -lfreetype" \
./autogen.sh \
  --prefix=/usr \
  --build=$TUPL \
  --host=$TUPL \
  --target=$TUPL \
  --disable-gtk-doc-html \
  --with-sysroot=$GLAD \
  --with-glib \
  --without-cairo \
  --without-fontconfig \
  --without-icu \
  --with-freetype
```

## Build
```shell
make
```

## Install
```shell
make \
  DESTDIR=$SCER/$name/sac \
  install-strip
```
