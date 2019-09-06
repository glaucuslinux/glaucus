# libxcb-image

## Name
libxcb-image

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://gitlab.freedesktop.org/xorg/lib/libxcb-image

## Cysts
* musl
* util-macros

## Description
XCB port of Xlib's XImage and XShmImage functions

## License
* MIT

## Prepare
```shell
rsync -vah $CERD/$name/$name $SSRC --delete
cd $SSRC/$name

$version submodule update --init
```

## Configure
```shell
ACLOCAL_PATH=$GLAD/usr/share/aclocal \
./autogen.sh \
  --prefix=/usr \
  --build=$TUPL \
  --host=$TUPL \
  --target=$TUPL \
  --disable-static \
  --disable-devel-docs \
  --with-sysroot=$GLAD \
  --without-doxygen
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
