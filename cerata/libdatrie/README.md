# libdatrie

## Name
libdatrie

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://github.com/tlwg/libdatrie

## Cyst
* musl

## Description
An implementation of double-array structure for representing trie, as proposed
by Junichi Aoe

## License
* LGPLv2.1+

## Prepare
```shell
rsync -vah $CERD/$name/$name $SSRC --delete
cd $SSRC/$name
```

## Configure
```shell
./autogen.sh
./configure \
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
  install-strip
```
