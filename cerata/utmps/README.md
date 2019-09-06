# utmps

## Name
utmps

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://skarnet.org/cgi-bin/cgit.cgi/utmps

## Cysts
* skalibs
* s6

## Description
A secure utmp/wtmp implementation

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
