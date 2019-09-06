# libelf-compat

## Name
libelf-compat

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://github.com/sabotage-linux/libelf-compat

## Cyst
* musl

## Description
libelf stripped off of elfutils 0.152 and cleaned up portability issues and
autocrap

## Licenses
* GPLv2+
* GPLv3+
* LGPLv3

## Prepare
```shell
rsync -vah $CERD/$name/$name $SSRC --delete
cd $SSRC/$name
```

## Configure
```shell
cat > config.mak << EOF
prefix=/usr
sysconfdir=/etc
CFLAGS=$CFLAGS -std=gnu99 -D_GNU_SOURCE
CC=$CC
AR=$AR
RANLIB=$RANLIB
EOF
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
