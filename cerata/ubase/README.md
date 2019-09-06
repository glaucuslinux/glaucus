# ubase

## Name
ubase

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://git.suckless.org/ubase

## Cyst
* musl

## Description
Suckless Linux base utils

## License
* MIT

## Prepare
```shell
rsync -vah $CERD/$name/$name $SSRC --delete
cd $SSRC/$name
```

```shell
sed 's/\/var\/run/\/run/' \
  -i config.def.h
```

```shell
sed 's/\/bin/\/usr&/' \
  -i config.def.h getty.8 getty.c login.c su.c
```

```shell
sed 's/utmp/utmpx/' \
  -i getty.c last.c login.c who.c
```

```shell
sed 's/.*types.*/#include <sys\/sysmacros.h>/' \
  -i mknod.c mountpoint.c stat.c
```

```shell
sed '/stat.h/a #include <sys/sysmacros.h>' \
  -i libutil/tty.c
```

## Configure
```shell
sed -e 's/^PREFIX = .*/PREFIX = \/usr/' \
  -e "s/AR = .*/AR = $AR/" \
  -e "s/CC = .*/CC = $TUPL-gcc --sysroot=\/home\/glaucus\/system/" \
  -e "s/RANLIB = .*/RANLIB = $RANLIB/" \
  -e "s/CFLAGS   = .*/CFLAGS = $CFLAGS -std=c99 -Wall -Wextra/" \
  -e '/CPPFLAGS/ s/$/ -I\/home\/glaucus\/system\/usr\/include/' \
  -e "s/LDFLAGS  = .*/LDFLAGS = $LDFLAGS/" \
  -i config.mk
```

```shell
sed '/halt/d' \
  -i Makefile
```

## Build
```shell
make
```

## Install
```shell
make \
  DESTDIR=$SCER/$name/sac \
  install
```
