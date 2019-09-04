# libFS

## Name
libFS

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://gitlab.freedesktop.org/xorg/lib/libfs

## Cysts
* musl
* util-macros
* xorgproto
* libxtrans

## Description
X Font Service client library

## License
* MIT

## Prepare
```shell
rsync -vah $CERD/$name/libfs/ $SSRC/$name --delete
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
  --disable-ipv6
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
