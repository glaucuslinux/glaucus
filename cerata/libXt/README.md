# libXt

## Name
libXt

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://gitlab.freedesktop.org/xorg/lib/libxt

## Cysts
* musl
* util-macros

## Description
X Toolkit Intrinsics library

## License
* MIT

## Prepare
```shell
rsync -vah $CERD/$name/libxt/ $SSRC/$name --delete
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
  --disable-specs \
  --without-xmlto \
  --without-fop \
  --without-xsltproc \
  --without-perl \
  --without-glib
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
