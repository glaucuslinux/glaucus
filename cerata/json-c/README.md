# json-c

## Name
json-c

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://github.com/json-c/json-c

## Cyst
* musl

## Description
A JSON implementation in C

## License
* MIT

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
  install-strip
```
