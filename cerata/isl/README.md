# isl

## Name
isl

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://repo.or.cz/isl

## Cyst

## Description
A library for manipulating sets and relations of integer points bounded by
linear constraints

## Licenses
* MIT

## Prepare Toolchain
```shell
rsync -vah $CERD/$name/$name $TSRC --delete
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

## Build Toolchain
```shell
make
```

## Install Toolchain
```shell
make \
  install-strip
```
