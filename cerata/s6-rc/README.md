# s6-rc

## Name
s6-rc

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://skarnet.org/cgi-bin/cgit.cgi/s6-rc

## Cysts
* skalibs
* execline
* s6

## Description
skarnet's service manager for s6-based systems

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
  --libexecdir=/usr/lib/libexec \
  --with-sysdeps=$GLAD/usr/lib/skalibs/sysdeps \
  --with-include=$GLAD/usr/include \
  --with-dynlib=$GLAD/usr/lib \
  --enable-shared \
  --disable-static \
  --disable-allstatic \
  --disable-all-pic
```

```shell
sed -e "s/CFLAGS := .*/CFLAGS := $CFLAGS -fno-stack-protector/" \
  -e "s/LDFLAGS := .*/LDFLAGS := $LDFLAGS -Wl,-rpath-link,\/home\/glaucus\/system\/usr\/lib/" \
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
