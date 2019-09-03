# dash

## Name
dash

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://git.kernel.org/pub/scm/utils/dash/dash

## Cysts
* musl
* mawk

## Description
The Debian Almquist shell is a POSIX-compliant shell derived from the NetBSD
Almquist shell

## Licenses
* BSDv3
* GPLv2+
* PD

## Prepare
```shell
rsync -vah $CERD/$name/$name $SSRC --delete
cd $SSRC/$name
```

## Configure
```shell
./autogen.sh
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
install -dv $SCER/$name/sac/usr/bin
make \
  DESTDIR=$SCER/$name/sac \
  install-strip
```

```shell
cd $SCER/$name/sac/usr/bin
ln -fsv $name sh
```
