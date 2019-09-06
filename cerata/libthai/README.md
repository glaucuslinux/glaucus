# libthai

## Name
libthai

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://github.com/tlwg/libthai

## Cysts
* musl
* libdatrie

## Description
A set of Thai language support routines aimed to ease developers' tasks to
incorporate Thai language support in their applications

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
CFLAGS="$CFLAGS -I$GLAD/usr/include" \
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
