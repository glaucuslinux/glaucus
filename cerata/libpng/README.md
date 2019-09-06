# libpng

## Name
libpng

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://github.com/glennrp/libpng

## Cysts
* musl
* zlib

## Description
The official PNG reference library

## Licenses
* Apachev2.0
* BSDv2
* GPLv2+
* libpngv2
* MIT
* zlib

## Prepare
```shell
mkdir -v $SBLD/$name
cd $SBLD/$name
```

## Configure
```shell
$CERD/$name/$name/configure \
  --prefix=/usr \
  --build=$TUPL \
  --host=$TUPL \
  --target=$TUPL \
  --disable-static \
  --enable-hardware-optimizations \
  --enable-intel-sse \
  --with-zlib-prefix=$GLAD
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
