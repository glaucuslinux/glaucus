# libressl

## Name
libressl

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://github.com/libressl-portable/portable

## Cysts
* musl
* mawk

## Description
A free version of the TLS/crypto stack forked from OpenSSL with a modern
codebase and improved security

## Licenses
* Apachev1.0
* BSDv4
* GPLv2+
* GPLv3+
* ISC
* OpenSSL
* PD
* SSLeay

## Prepare
```shell
rsync -vah $CERD/$name/portable/ $SSRC/$name --delete
rsync -vah $CERD/$name/openbsd $SSRC/$name --delete
cd $SSRC/$name
```

## Configure
```shell
./autogen.sh
```

```shell
sed -e "s/USER_CFLAGS=.*/USER_CFLAGS=\"$CFLAGS\"/" \
  -e "s/CFLAGS=\"-g\"/CFLAGS=\"$CFLAGS\"/" \
  -e "s/CFLAGS=\"-g -O2\"/CFLAGS=\"$CFLAGS\"/" \
  -e "s/CFLAGS=\"-O2\"/CFLAGS=\"$CFLAGS\"/" \
  -i configure
```

```shell
./configure \
  --prefix=/usr \
  --build=$TUPL \
  --host=$TUPL \
  --target=$TUPL \
  --disable-static
```

```shell
sed 's/tests //' \
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
  install-strip
```
