# libX11

## Name
libX11

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://gitlab.freedesktop.org/xorg/lib/libx11

## Cysts
* musl
* util-macros
* libxtrans

## Description
Core X11 protocol client library (aka "Xlib")

## License
* MIT

## Prepare
```shell
rsync -vah $CERD/$name/libx11/ $SSRC/$name --delete
cd $SSRC/$name
```

## Configure
```shell
ACLOCAL_PATH=$GLAD/usr/share/aclocal \
CFLAGS="$CFLAGS -I$GLAD/usr/include" \
./autogen.sh \
  --prefix=/usr \
  --build=$TUPL \
  --host=$TUPL \
  --target=$TUPL \
  --disable-static \
  --disable-specs \
  --disable-xf86bigfont \
  --without-xmlto \
  --without-fop \
  --without-xsltproc \
  --without-perl \
  --without-launchd
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
