# libarchive

## Name
libarchive

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://github.com/libarchive/libarchive

## Cysts
* musl
* mawk

## Description
Multi-format archive and compression library

## License
* BSDv3

## Prepare
```shell
rsync -vah $CERD/$name/$name $SSRC --delete
cd $SSRC/$name
```

## Configure
```shell
./build/autogen.sh
./configure \
  --prefix=/usr \
  --build=$TUPL \
  --host=$TUPL \
  --target=$TUPL \
  --disable-static \
  --disable-acl \
  --without-zstd \
  --without-cng \
  --without-nettle \
  --without-openssl \
  --without-xml2 \
  --without-expat
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
