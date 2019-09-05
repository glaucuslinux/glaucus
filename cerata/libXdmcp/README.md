# libXdmcp

## Name
libXdmcp

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://gitlab.freedesktop.org/xorg/lib/libxdmcp

## Cysts
* musl
* util-macros
* xorgproto

## Description
X Display Manager Control Protocol library

## License
* MIT

## Prepare
```shell
rsync -vah $CERD/$name/libxdmcp/ $SSRC/$name --delete
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
  --disable-unit-tests \
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
