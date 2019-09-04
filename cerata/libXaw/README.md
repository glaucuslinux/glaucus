# libXaw

## Name
libXaw

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://gitlab.freedesktop.org/xorg/lib/libxaw

## Cysts
* musl
* util-macros

## Description
X Athena Widget Set, based on the X Toolkit Intrinsics (Xt) Library

## License
* MIT

## Prepare
```shell
rsync -vah $CERD/$name/libxaw/ $SSRC/$name --delete
cd $SSRC/$name
```

## Configure
```shell
ACLOCAL_PATH=$GLAD/usr/share/aclocal \
./autogen.sh \
  --prefix=/usr \
  --build=$TUPL \
  --host=$TUPL \
  --target=$TUPL \
  --disable-static \
  --disable-specs \
  --disable-xaw6 \
  --disable-xaw7 \
  --without-xmlto \
  --without-fop \
  --without-xsltproc
```

## Build
```shell
make
```

## Install
```shell
install -dv $SCER/$name/sac/usr/lib
make \
  DESTDIR=$SCER/$name/sac \
  install-strip
```
