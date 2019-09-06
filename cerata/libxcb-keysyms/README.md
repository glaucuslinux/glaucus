# libxcb-keysyms

## Name
libxcb-keysyms

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://gitlab.freedesktop.org/xorg/lib/libxcb-keysyms

## Cysts
* musl
* util-macros

## Description
Standard X key constants and conversion to/from keycodes

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
