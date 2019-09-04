# jemalloc

## Name
jemalloc

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://github.com/jemalloc/jemalloc

## Cyst
* musl

## Description
A general purpose malloc(3) implementation that emphasizes fragmentation
avoidance and scalable concurrency support

## License
* BSDv2

## Prepare
```shell
rsync -vah $CERD/$name/$name $SSRC --delete
cd $SSRC/$name
```

## Configure
```shell
./autogen.sh \
  --prefix=/usr \
  --build=$TUPL \
  --host=$TUPL \
  --target=$TUPL \
  --disable-static
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
