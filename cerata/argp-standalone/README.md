# argp-standalone

## Name
argp-standalone

## Version
1.4-test2

## Release
1

## Architecture
* x86-64

## URL
http://www.lysator.liu.se/~nisse/misc/argp-standalone-1.4-test2.tar.gz

## Checksum
ea8f9823e62530c941702b4310a727abe234476d17b921bc0eef79fbc067995f4132a9309391ae412ecfc6d370437ffd3990bd8dac1d00ee5ff6a1588f32afd1

## Cyst
* musl

## Description
Standalone version of arguments parsing functions from GLIBC for use with musl

## Licenses
* GPLv2+
* GPLv3+
* PD
* XC

## Prepare
```shell
rsync -vah $CERD/$name/$name $SSRC --delete
cd $SSRC/$name
```

```shell
patch -p1 -i $CERD/$name/patches/$name.patch
```

```shell
sed 's/#ifdef __OPTIMIZE__/#if 0/g' \
  -i argp-fmtstream.h
```

## Configure
```shell
./configure \
  --prefix=/usr \
  --build=$TUPL \
  --host=$TUPL \
  --target=$TUPL
```

## Build
```shell
make
```

## Install
```shell
make DESTDIR=$SCER/$name/sac \
  install-strip
```
