# libXcomposite

## Name
libXcomposite

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://gitlab.freedesktop.org/xorg/lib/libXcomposite

## Cysts
* musl
* util-macros

## Description
Xlib-based client library for the Composite extension to the X11 protocol

## License
* MIT

## Prepare
```shell
rsync -vah $CERD/$name/libxcomposite/ $SSRC/$name --delete
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
  --without-xmlto
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
