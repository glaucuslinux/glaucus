# libffi

## Name
libffi

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://github.com/libffi/libffi

## Cyst
* musl

## Description
A portable foreign-function interface library

## License
* MIT

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

```shell
sed 's/\/\.\.\/lib64//' \
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
