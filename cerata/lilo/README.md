# lilo

## Name
lilo

## Version
24.2

## Release
1

## Architecture
* x86-64

## URL
https://alioth-archive.debian.org/releases/lilo/Lilo/24.2/lilo-24.2.tar.gz

## Cysts
* musl
* bin86

## Description
Standard LInux boot LOader

## Licenses
* BSDv3
* GPLv2+
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
sed -e '/images/d' \
  -e '/checkit/d' \
  -i Makefile
```

```shell
sed -e "s/OPT=.*/OPT=$CFLAGS/" \
  -e 's/SBIN_DIR=\/sbin/SBIN_DIR=\/usr\/bin/' \
  -e 's/USRSBIN_DIR=.*/USRSBIN_DIR=\/usr\/bin/' \
  -i make.vars
```

```shell
sed -e "s/CC=.*/CC=$TUPL-gcc --sysroot=\/home\/glaucus\/system/" \
  -e 's/as86/\/home\/glaucus\/system\/usr\/bin\/as86/' \
  -e 's/ld86/\/home\/glaucus\/system\/usr\/bin\/ld86/' \
  -e "s/NASM=nasm/NASM=\\$TOOL\/bin\/x86_64-pc-linux-musl-as/" \
  -i src/Makefile
```

## Build
```shell
make
```

## Install
```shell
install -Dv src/$name $SCER/$name/sac/usr/bin/$name
install -Dv $CERD/$name/$name.conf $SCER/$name/sac/etc/$name.conf
```
