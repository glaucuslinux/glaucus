# nldev

## Name
nldev

## Version
git

## Release
1

## Architecture
* x86-64

## URL
git://r-36.net/nldev

## Cyst
* musl

## Description
A netlink frontend for mdev, replacing the over-engineered udevd

## License
* MIT

## Prepare
```shell
rsync -vah $CERD/$name/$name $SSRC --delete
cd $SSRC/$name
```

## Configure
```shell
sed -e "s/CFLAGS = .*/CFLAGS = $CFLAGS -std=c99 -pedantic -Wall -I\/home\/glaucus\/system\/usr\/include -DVERSION=0.3 -D_DEFAULT_SOURCE -D_GNU_SOURCE/" \
  -e "s/LDFLAGS = .*/LDFLAGS = $LDFLAGS -L\/home\/glaucus\/system\/usr\/lib/" \
  -e "s/CC = .*/CC = $TUPL-gcc --sysroot=\/home\/glaucus\/system/" \
  -i config.mk
```

```shell
sed 's/busybox ash/sh/' \
  -i nltrigger run_nldev
```

## Build
```shell
make
```

## Install
```shell
make \
  DESTDIR=$SCER/$name/sac \
  install
```
