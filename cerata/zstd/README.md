# zstd

## Name
zstd

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://github.com/facebook/zstd

## Cyst
* musl

## Description
Zstandard - Fast real-time compression algorithm

## Licenses
* BSDv3
* GPLv2+

## Prepare Toolchain
```shell
rsync -vah $CERD/$name/$name $TSRC --delete
cd $TSRC/$name
```

## Configure Toolchain

## Build Toolchain
```shell
make \
  HAVE_THREAD=1 \
  ZSTD_LEGACY_SUPPORT=0 \
  HAVE_ZLIB=0 \
  HAVE_LZMA=0 \
  HAVE_LZ4=0 \
  BACKTRACE=0
```

## Install Toolchain
```shell
make \
  PREFIX=$TOOL \
  install
```
