# smdev

## Name
smdev

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://git.suckless.org/smdev

## Cyst
* musl

## Description
Suckless mdev

## License
* MIT

## Prepare
```shell
rsync -vah $CERD/$name/$name $SSRC --delete
rsync -vah $CERD/$name/config.h $SSRC --delete
cd $SSRC/$name
```

```shell
sed -e '/types/a #include <sys/sysmacros.h>' \
  -i smdev.c
```

```shell
patch -Np1 -i $CERD/$name/patches/$name.patch
```

## Configure
```shell
sed -e 's/PREFIX = .*/PREFIX = \/usr/' \
  -e "s/CC = .*/CC = $TUPL-gcc --sysroot=\/home\/glaucus\/system/" \
  -e "s/CFLAGS   = .*/CFLAGS = $CFLAGS -std=c99 -Wall -pedantic -D_BSD_SOURCE -D_GNU_SOURCE/" \
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

```shell
cd $CERD/$name
install -m 744 -Dv proceeddev $SCER/$name/sac/etc/$name/proceeddev
install -m 644 -Dv 00-modprobe 01-uuid 10-cdrom 20-pci 20-platform -t \
  $SCER/$name/sac/etc/$name/add
install -m 644 -Dv 99-remove_links $SCER/$name/sac/etc/$name/remove
```
