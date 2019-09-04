# gettext-tiny

## Name
gettext-tiny

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://github.com/sabotage-linux/gettext-tiny

## Cyst
* musl

## Description
Lightweight replacements for tools typically used from the GNU gettext suite

## License
* MIT

## Prepare
```shell
rsync -vah $CERD/$name/$name $SSRC --delete
cd $SSRC/$name
```

## Configure
```shell
cat > config.mak << EOF
prefix=/usr
LIBINTL=MUSL
AR=$AR
CC=$CC
RANLIB=$RANLIB
CFLAGS=$CFLAGS
LDFLAGS=$LDFLAGS
EOF
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
