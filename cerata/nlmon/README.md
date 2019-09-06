# nlmon

## Name
nlmon

## Version
git

## Release
1

## Architecture
* x86-64

## URL
git://r-36.net/nlmon

## Cyst
* musl

## Description
Replaces udevadm for monitoring network devices

## License
* MIT

## Prepare
```shell
rsync -vah $CERD/$name/$name $SSRC --delete
cd $SSRC/$name
```

## Configure
```shell
sed -e "s/CFLAGS = .*/CFLAGS = $CFLAGS -std=c99 -pedantic -Wall -I\/home\/glaucus\/system\/usr\/include -DVERSION=0.3/" \
  -e "s/LDFLAGS = .*/LDFLAGS = $LDFLAGS -L\/home\/glaucus\/system\/usr\/lib/" \
  -e "s/CC = .*/CC = $TUPL-gcc --sysroot=\/home\/glaucus\/system/" \
  -i config.mk
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
