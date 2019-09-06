# sbase

## Name
sbase

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://git.suckless.org/sbase

## Cyst
* musl

## Description
Suckless Unix tools

## License
* MIT

## Prepare
```shell
rsync -vah $CERD/$name/$name $SSRC --delete
cd $SSRC/$name
```

```shell
sed 's/\/bin/\/usr&/' \
  -i chroot.c cron.c xargs.c
```

```shell
sed 's/\/tmp/\/run\/tmp/' \
  -i ed.c mktemp.1 mktemp.c sponge.c
```

```shell
sed -e '/types/,+1d' \
  -e '/endif/d' \
  -i ls.c tar.c
```

## Configure
```shell
sed -e 's/^PREFIX = .*/PREFIX = \/usr/' \
  -e "s/AR = .*/AR = $AR/" \
  -e "s/CC = .*/CC = $TUPL-gcc --sysroot=\/home\/glaucus\/system/" \
  -e "s/RANLIB = .*/RANLIB = $RANLIB/" \
  -e "s/CFLAGS   = .*/CFLAGS = $CFLAGS -std=c99 -Wall -pedantic/" \
  -e '/CPPFLAGS/ s/$/ -I\/home\/glaucus\/system\/usr\/include/' \
  -e "s/LDFLAGS  = .*/LDFLAGS = $LDFLAGS/" \
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
