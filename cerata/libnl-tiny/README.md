# libnl-tiny

## Name
libnl-tiny

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://github.com/sabotage-linux/libnl-tiny

## Cyst
* musl

## Description
A fork of openwrt's tiny replacement for libnl versions 1 and 2

## License
* LGPLv2.1

## Prepare
```shell
rsync -vah $CERD/$name/$name $SSRC --delete
cd $SSRC/$name
```

## Configure
```shell
cat > config.mak << EOF
prefix=/usr
AR=$AR
CC=$CC
RANLIB=$RANLIB
CFLAGS=$CFLAGS
CPPFLAGS=$CPPFLAGS
LDFLAGS=$LDFLAGS
EOF
```

```shell
sed 's/ $(STATICLIB)//' \
    -i Makefile
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
