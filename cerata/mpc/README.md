# mpc

## Name
mpc

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://scm.gforge.inria.fr/anonscm/git/mpc/mpc

## Cysts
* gmp
* mpfr

## Description
A C library for the arithmetic of complex numbers with arbitrarily high
precision and correct rounding of the result

## Licenses
* GFDLv1.3+
* LGPLv2.1+
* LGPLv3.0+
* PD

## Prepare Toolchain
```shell
rsync -vah $CERD/$name/$name/ $TSRC/$name --delete
cd $TSRC/$name
```

## Configure Toolchain
```shell
autoreconf -vi
./configure \
  --prefix=$TOOL \
  --disable-static \
  --with-mpfr=$TOOL \
  --with-gmp=$TOOL
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
