# netbsd-curses

## Name
netbsd-curses

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://github.com/sabotage-linux/netbsd-curses

## Cyst
* musl

## Description
A port of NetBSD's curses library for usage on Linux systems

## License
* BSDv2
* BSDv3

## Prepare
```shell
rsync -vah $CERD/$name/$name $SSRC --delete
cd $SSRC/$name
```

## Configure
```shell
cat > config.mak << EOF
PREFIX = /usr
AR = $AR
AWK = $AWK
CC = $CC
RANLIB = $RANLIB
CFLAGS = $CFLAGS
LDFLAGS = $LDFLAGS
EOF
```

```shell
sed -e '/$(BINDIR)\/clear/ s/$/.sh/' \
  -e 's/-O0 //' \
  -i GNUmakefile
```

## Build
```shell
make \
  all-dynamic
```

## Install
```shell
make \
  DESTDIR=$SCER/$name/sac \
  install-dynamic
```

```shell
$STRIP -v $SCER/$name/sac/usr/lib/libcurses.so \
  $SCER/$name/sac/usr/lib/libform.so \
  $SCER/$name/sac/usr/lib/libmenu.so \
  $SCER/$name/sac/usr/lib/libpanel.so \
  $SCER/$name/sac/usr/lib/libterminfo.so
```
