# libXfont

## Name
libXfont

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://gitlab.freedesktop.org/xorg/lib/libxfont

## Cysts
* musl
* util-macros

## Description
X font handling library for server & utilities

## License
* MIT

## Prepare
```shell
rsync -vah $CERD/$name/libxfont/ $SSRC/$name --delete
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
  --disable-devel-docs \
  --disable-ipv6 \
  --without-xmlto \
  --without-fop
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
