# libXScrnSaver

## Name
libXScrnSaver

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://gitlab.freedesktop.org/xorg/lib/libxscrnsaver

## Cysts
* musl
* util-macros

## Description
Xlib-based X11 Screen Saver extension client library

## License
* MIT

## Prepare
```shell
rsync -vah $CERD/$name/libxscrnsaver/ $SSRC/$name --delete
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
