# fribidi

## Name
fribidi

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://github.com/fribidi/fribidi

## Cyst
* musl

## Description
The Free Implementation of the Unicode Bidirectional Algorithm

## Licenses
* GPLv2+
* GPLv3+
* LGPLv2.1+
* MIT

## Prepare
```shell
rsync -vah $CERD/$name/$name $SSRC --delete
cd $SSRC/$name
```

## Configure
```shell
./autogen.sh \
  --prefix=/usr \
  --build=$TUPL \
  --host=$TUPL \
  --target=$TUPL \
  --disable-deprecated
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
