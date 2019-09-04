# fontconfig

## Name
fontconfig

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://gitlab.freedesktop.org/fontconfig/fontconfig

## Cysts
* musl
* expat
* json-c
* freetype

## Description
Font configuration and customization library

## Licenses
* GPLv3+
* HPND
* MIT

## Prepare
```shell
rsync -vah $CERD/$name/$name $SSRC --delete
cd $SSRC/$name
```

## Configure
```shell
FREETYPE_CFLAGS="-I$GLAD/usr/include/freetype2 -I$GLAD/usr/include/libpng16 -I$GLAD/usr/include/harfbuzz -I$GLAD/usr/include/glib-2.0 -I$GLAD/usr/lib/glib-2.0/include" \
FREETYPE_LIBS="-L$GLAD/usr/lib -lfreetype" \
JSONC_CFLAGS="-I$GLAD/usr/include/json-c" \
JSONC_LIBS="-L$GLAD/usr/lib -ljson-c" \
./autogen.sh \
  --prefix=/usr \
  --sysconfdir=/etc \
  --localstatedir=/var \
  --build=$TUPL \
  --host=$TUPL \
  --target=$TUPL \
  --disable-nls \
  --disable-docs \
  --with-sysroot=$GLAD \
  --without-libiconv \
  --with-expat=$GLAD/usr
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
