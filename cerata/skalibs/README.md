# skalibs

## Name
skalibs

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://skarnet.org/cgi-bin/cgit.cgi/skalibs

## Cyst
* musl

## Description
skarnet's general purpose C libraries for system programming and small and
secure C development

## License
* ISC

## Prepare
```shell
rsync -vah $CERD/$name/$name $SSRC --delete
cd $SSRC/$name
```

## Configure
```shell
./configure \
  --target=$TUPL \
  --host=$TUPL \
  --build=$TUPL \
  --prefix=/usr \
  --disable-static \
  --disable-all-pic \
  --disable-ipv6 \
  --enable-clock
```

```shell
sed -e "s/CFLAGS := .*/CFLAGS := $CFLAGS -fno-stack-protector/" \
  -e 's/-Wl,--hash-style=both //' \
  -i config.mak
```

## Build
```shell
make \
  strip
```

## Install
```shell
make \
  DESTDIR=$SCER/$name/sac \
  install
```
