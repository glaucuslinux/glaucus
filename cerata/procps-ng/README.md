# procps-ng

## Name
procps-ng

## Version
3.3.16

## Release
1

## Architecture
* x86-64

## URL
https://downloads.sourceforge.net/project/procps-ng/Production/procps-ng-3.3.16.tar.xz

## Checksum
d83da472df256b188c32082632202e7f8ebd1b161082387760876ae34d50221b3682299a2816a7d6a29afb40322743c31b87d92ca299c2944a6b55e50736d367

## Cysts
* musl
* pkgconf
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
