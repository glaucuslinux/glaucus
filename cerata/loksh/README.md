# loksh

## Name
loksh

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://github.com/dimkr/loksh

## Cysts
* musl
* netbsd-curses

## Description
A port of the OpenBSD ksh to Linux

## Cluster
core

## License
* PD

## Prepare
```shell
rsync -vah $CERD/$name/$name $SSRC --delete
cd $SSRC/$name
```

## Configure
```shell
sed -e "s/CC ?= cc/CC = $TUPL-gcc --sysroot=\/home\/glaucus\/system/" \
  -e "s/CFLAGS ?= -O2/CFLAGS = $CFLAGS -I\/home\/glaucus\/system\/usr\/include/" \
  -e "s/LDFLAGS ?=/LDFLAGS = $LDFLAGS -L\/home\/glaucus\/system\/usr\/lib/" \
  -e 's/DESTDIR ?= \//DESTDIR = \/home\/glaucus\/system/' \
  -e 's/BIN_NAME ?= ksh/BIN_NAME = loksh/' \
  -e 's/?//' \
  -e '28s/$/-lterminfo/' \
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

```shell
cd $SCER/$name/sac/usr/bin
ln -fsv $name ksh
```
