# file

## Name
file

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://github.com/file/file

## Cysts
* musl
* mawk

## Description
File type guesser that uses "magic" numbers to scan binary data for patterns

## Licenses
* Apachev2.0
* BSDv2
* BSDv3
* GPLv2+
* GPLv3+

## Prepare
```shell
rsync -vah $CERD/$name/$name $SSRC --delete
cd $SSRC/$name
```

## Configure
```shell
autoreconf -vfi
./configure \
  --prefix=/usr \
  --build=$TUPL \
  --host=$TUPL \
  --target=$TUPL \
  --disable-libseccomp \
  --enable-fsect-man5
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
