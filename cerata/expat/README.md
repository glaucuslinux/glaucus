# expat

## Name
expat

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://github.com/libexpat/libexpat

## Cyst
* musl

## Description
Fast streaming XML parser written in C

## License
* MIT

## Prepare
```shell
rsync -vah $CERD/$name/lib$name/$name $SSRC --delete
cd $SSRC/$name
```

```shell
./buildconf.sh
```

```shell
mkdir -v $SBLD/$name
cd $SBLD/$name
```

## Configure
```shell
$SSRC/$name/configure \
  --prefix=/usr \
  --build=$TUPL \
  --host=$TUPL \
  --target=$TUPL \
  --disable-static \
  --without-xmlwf \
  --without-examples \
  --without-tests
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
