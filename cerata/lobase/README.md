# lobase

## Name
lobase

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://git.duncano.de/lobase

## Cysts
* musl
* mawk

## Description
A port of the OpenBSD userland to Linux

## Licenses
* ISC
* PD

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
  --target=$TUPL
```

## Build
```shell
for dir in lib/libopenbsd lib/liboutil bin/ls bin/pax bin/stty usr.bin/diff \
  usr.bin/fmt usr.bin/patch usr.bin/sort; do
  cd $dir

  make

  cd ../..
done
```

## Install
```shell
for dir in bin/ls bin/stty usr.bin/diff usr.bin/fmt usr.bin/patch \
  usr.bin/sort; do
  cd $dir

  make \
    BINDIR=/usr/bin \
    DESTDIR=$SCER/$name/sac \
    install

  cd ../..
done
```

```shell
install -v bin/pax/pax $SCER/$name/sac/usr/bin
install -m 444 -Dv bin/pax/cpio.1 bin/pax/pax.1 bin/pax/tar.1 -t \
  $SCER/$name/sac/usr/share/man/man1
```

```shell
cd $SCER/$name/sac/usr/bin
ln -fsv pax cpio
ln -fsv pax tar
```
