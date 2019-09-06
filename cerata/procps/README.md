# procps

## Name
procps

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://gitlab.com/procps-ng/procps

## Cysts
* musl
* netbsd-curses
* skalibs
* execline
* s6
* utmps

## Description
Command line and full screen utilities for browsing procfs

## Licenses
* GPLv2+
* GPLv3+
* LGPLv2.1+

## Prepare
```shell
rsync -vah $CERD/$name/$name $SSRC --delete
cd $SSRC/$name
```

```shell
patch -p1 -i $CERD/$name/patches/$name.patch
```

## Configure
```shell
./autogen.sh
CFLAGS="$CFLAGS -I$GLAD/usr/include" \
LDFLAGS="$LDFLAGS -L$GLAD/usr/lib -lncursesw -lterminfo -lutmps -lskarnet" \
./configure \
  --prefix=/usr \
  --sbindir=/usr/bin \
  --build=$TUPL \
  --host=$TUPL \
  --target=$TUPL \
  --disable-static \
  --disable-nls
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
