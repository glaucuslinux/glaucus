# procps-ng

## Name
procps-ng

## Version
3.3.15

## Release
1

## Architecture
* x86-64

## URL
https://downloads.sourceforge.net/project/procps-ng/Production/procps-ng-3.3.15.tar.xz

## Checksum
bc83ccc1941e7be8266588fdfbba17e2424b30163a215873ee6dee96215d66249f5d5e46fec2278d030b42bd7599861c4878360042dacec4c221ce411453747c

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
