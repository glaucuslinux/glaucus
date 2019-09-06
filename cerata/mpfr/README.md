# mpfr

## Name
mpfr

## Version
svn

## Release
1

## Architecture
* x86-64

## URL
https://scm.gforge.inria.fr/anonscm/svn/mpfr/trunk

## Cyst
* gmp

## Description
A portable library written in C for arbitrary precision arithmetic on
floating-point numbers

## Licenses
* LGPLv2.1+
* LGPLv3.0+
* PD

## Prepare Toolchain
```shell
rsync -vah $CERD/$name/trunk/ $TSRC/$name --delete
cd $TSRC/$name
```

## Configure Toolchain
```shell
./autogen.sh
./configure \
  --prefix=$TOOL \
  --disable-static \
  --with-gmp=$TOOL
```

## Build
```shell
make
```

## Install
```shell
make \
  install-strip
```
