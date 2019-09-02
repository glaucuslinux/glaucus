# bin86

## Name
bin86

## Version
0.16.21

## Release
1

## Architecture
* x86-64

## URL
https://v3.sk/~lkundrak/dev86/bin86-0.16.21.tar.gz

## Checksum
e80e06965fbdcf13100aae4690071d01a6efe74aed7ff8f14e5892c6803393a1b5acda1296e0f0e1837dfb73e0edd02e9cccfeabbeabe1b68fa6b6b85ced1f56

## Cyst
* musl

## Description
A simple complete cross-development C assembler and linker which can generate 16 or 32-bit code for the production of 8086 - 80386 executables

## License
* GPLv2+

## Prepare
```shell
rsync -vah $CERD/$name/$name $SSRC --delete
cd $SSRC/$name
```

```shell
patch -p0 -i $CERD/$name/patches/$name.patch
```

## Configure
```shell
sed -e "2s/CFLAGS=.*/CFLAGS=$CFLAGS -D_POSIX_SOURCE/" \
  -e "3s/LDFLAGS=/LDFLAGS=$LDFLAGS/" \
  -e '9d;11d;12d;13d' \
  -i Makefile
```

## Build
`make`

## Install
```shell
install -dv $SCER/$name/sac/usr/bin $SCER/$name/sac/usr/share/man/man1
make PREFIX=$SCER/$name/sac/usr \
  install
```
