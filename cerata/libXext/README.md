# libXext

## Name
libXext

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://gitlab.freedesktop.org/xorg/lib/libxext

## Cysts
* musl
* util-macros
* libX11

## Description
Xlib-based library for common extensions to the X11 protocol

## License
* MIT

## Prepare
```shell
rsync -vah $CERD/$name/libxext/ $SSRC/$name --delete
cd $SSRC/$name
```

## Configure
```shell
ACLOCAL_PATH=$GLAD/usr/share/aclocal \
CFLAGS="$CFLAGS -I$GLAD/usr/include" \
LDFLAGS="$LDFLAGS -I$GLAD/usr/lib" \
./autogen.sh \
  --prefix=/usr \
  --build=$TUPL \
  --host=$TUPL \
  --target=$TUPL \
  --disable-static \
  --disable-specs \
  --without-xmlto \
  --without-fop \
  --without-xsltproc
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
