# libXi

## Name
libXi

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://gitlab.freedesktop.org/xorg/lib/libxi

## Cysts
* musl
* util-macros

## Description
Xlib library for the X Input Extension

## License
* MIT

## Prepare
```shell
rsync -vah $CERD/$name/libxi/ $SSRC/$name --delete
cd $SSRC/$name
```

## Configure
```shell
ACLOCAL_PATH=$GLAD/usr/share/aclocal \
CFLAGS="$CFLAGS -I$GLAD/usr/include" \
./autogen.sh \
  --prefix=/usr \
  --build=$TUPL \
  --host=$TUPL \
  --target=$TUPL \
  --disable-static \
  --disable-docs \
  --disable-specs \
  --without-xmlto \
  --without-fop \
  --without-xsltproc \
  --without-asciidoc
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
