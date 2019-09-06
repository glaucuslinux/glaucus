# libxcb-render-util

## Name
libxcb-render-util

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://gitlab.freedesktop.org/xorg/lib/libxcb-render-util

## Cysts
* musl
* util-macros

## Description
XCB convenience functions for the Render extension

## License
* MIT

## Prepare
```shell
rsync -vah $CERD/$name/$name $SSRC --delete
cd $SSRC/$name
```

```shell
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
