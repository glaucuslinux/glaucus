# glib

## Name
glib

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://gitlab.gnome.org/GNOME/glib

## Cysts
* musl
* mawk
* libelf-compat
* zlib
* pcre

## Description
The low-level core library that forms the basis for projects such as GTK+ and
GNOME

## License
* LGPLv2.1+

## Prepare
```shell
rsync -vah $CERD/$name/$name $SSRC --delete
cd $SSRC/$name
```

```shell
mkdir -v $SBLD/$name
```

## Configure
```shell
CFLAGS="$CFLAGS -I$GLAD/usr/include" \
LDFLAGS="$LDFLAGS -L$GLAD/usr/lib" \
LD_LIBRARY_PATH=$GLAD/usr/lib \
meson \
  --prefix=/usr \
  -Dlibmount=false \
  $SBLD/$name
```

## Build
```shell
LD_LIBRARY_PATH=$GLAD/usr/lib \
ninja \
  -C $SBLD/$name
```

## Install
```shell
DESTDIR=$SCER/$name/sac \
ninja \
  -C $SBLD/$name \
  install
```
