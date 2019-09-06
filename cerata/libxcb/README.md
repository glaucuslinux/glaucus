# libxcb

## Name
libxcb

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://gitlab.freedesktop.org/xorg/lib/libxcb

## Cysts
* musl
* util-macros
* xorgproto
* libXau
* xcb-proto
* libXdmcp

## Description
C interface to the X Window System protocol, which replaces the traditional Xlib
interface

## License
* MIT

## Prepare
```shell
rsync -vah $CERD/$name/$name $SSRC --delete
cd $SSRC/$name
```

## Configure
```shell
sed 's/pthread-stubs //' \
  -i configure.ac
```

```shell
ACLOCAL_PATH=$GLAD/usr/share/aclocal \
CFLAGS="$CFLAGS -I$GLAD/usr/include" \
NEEDED_CFLAGS=-I$GLAD/usr/include \
NEEDED_LIBS="-L$GLAD/usr/lib -lXau" \
XCBPROTO_CFLAGS=-I$GLAD/usr/include \
XCBPROTO_LIBS=-L$GLAD/usr/lib \
XDMCP_CFLAGS=-I$GLAD/usr/include \
XDMCP_LIBS="-L$GLAD/usr/lib -lXdmcp" \
./autogen.sh \
  --prefix=/usr \
  --build=$TUPL \
  --host=$TUPL \
  --target=$TUPL \
  --disable-static \
  --disable-devel-docs \
  --enable-dri3 \
  --without-doxygen \
  --without-launchd
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
