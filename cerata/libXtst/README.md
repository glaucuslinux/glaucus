# libXtst

## Name
libXtst

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://gitlab.freedesktop.org/xorg/lib/libxtst

## Cysts
* musl
* util-macros

## Description
Xlib-based library for XTEST & RECORD extensions

## License
* MIT

## Prepare
```shell
rsync -vah $CERD/$name/libxtst/ $SSRC/$name --delete
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
