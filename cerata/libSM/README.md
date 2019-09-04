# libSM

## Name
libSM

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://gitlab.freedesktop.org/xorg/lib/libsm

## Cysts
* musl
* util-macros
* libxtrans
* libICE

## Description
X Session Management Library

## License
* MIT

## Prepare
```shell
rsync -vah $CERD/$name/libsm/ $SSRC/$name --delete
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
  --disable-ipv6 \
  --without-xmlto \
  --without-fop \
  --without-xsltproc \
  --without-libuuid
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
