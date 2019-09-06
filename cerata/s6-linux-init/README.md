# s6-linux-init

## Name
s6-linux-init

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://skarnet.org/cgi-bin/cgit.cgi/s6-linux-init

## Cysts
* skalibs
* execline
* s6
* utmps

## Description
skarnet's set of minimalistic tools to create an s6-based init system on a Linux
kernel

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
  --skeldir=/etc/s6-linux-init/skel \
  --with-sysdeps=$GLAD/usr/lib/skalibs/sysdeps \
  --with-include=$GLAD/usr/include \
  --with-dynlib=$GLAD/usr/lib \
  --enable-shared \
  --disable-static \
  --disable-allstatic \
  --disable-all-pic \
  --enable-utmps
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

```shell
rm -frv $SCER/$name/sac/etc
```
