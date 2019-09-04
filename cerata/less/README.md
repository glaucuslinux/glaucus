# less

## Name
less

## Version
551

## Release
1

## Architecture
* x86-64

## URL
http://www.greenwoodsoftware.com/less/less-551.tar.gz

## Checksum
ef5296b9ebd72f83c05cad8a0f7a5eec2290e9b358ee725e09e8541bd95f94c0e14ea22aa04b287a0654079338eaeae813f2235b8e9f819fbbc9040dd65a9585

## Cysts
* musl
* mawk
* netbsd-curses
* pcre2

## Description
A free, open-source and text-based terminal file pager

## Licenses
* BSDv2
* GPLv3+

## Prepare
```shell
rsync -vah $CERD/$name/$name $SSRC --delete
cd $SSRC/$name
```

## Configure
```shell
CFLAGS="$CFLAGS -I$GLAD/usr/include" \
LDFLAGS="$LDFLAGS -L$GLAD/usr/lib" \
./configure \
  --prefix=/usr \
  --build=$TUPL \
  --host=$TUPL \
  --target=$TUPL \
  --with-regex=pcre2
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
