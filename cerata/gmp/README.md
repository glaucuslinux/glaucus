# gmp

## Name
gmp

## Version
hg

## Release
1

## Architecture
* x86-64

## URL
https://gmplib.org/repo/gmp

## Cyst

## Description
A free library for arbitrary multiprecision arithmetic, operating on signed
integers, rational numbers, and floating-point numbers

## Licenses
* GPLv2+
* LGPLv3+
* PD

## Prepare Toolchain
```shell
rsync -vah $CERD/$name/$name $TSRC --delete
cd $TSRC/$name
```

## Configure Toolchain
```shell
./.bootstrap
./configure \
  --prefix=$TOOL \
  --disable-static \
  --enable-cxx
```

## Build Toolchain
```shell
make
```

## Install Toolchain
```shell
make \
  install-strip
```
