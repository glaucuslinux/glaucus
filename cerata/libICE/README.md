# libICE

## Name
libICE

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://gitlab.freedesktop.org/xorg/lib/libice

## Cysts
* musl
* util-macros

## Description
Inter-Client Exchange Library

## License
* MIT

## Prepare
```shell
rsync -vah $CERD/$name/libice/ $SSRC/$name --delete
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
  --disable-ipv6 \
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
