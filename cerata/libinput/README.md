# libinput

## Name
libinput

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://gitlab.freedesktop.org/libinput/libinput

## Cyst
* musl

## Description
Input device management and event handling library

## License
* MIT

## Prepare
```shell
rsync -vah $CERD/$name/$name $SSRC --delete
cd $SSRC/$name
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
make \
  DESTDIR=$SCER/$name/sac \
  install-strip
```
