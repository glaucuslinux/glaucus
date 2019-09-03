# drm

## Name
drm

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://gitlab.freedesktop.org/mesa/drm

## Cysts
* musl

## Description
libdrm Direct Rendering Manager library and headers

## License

## Prepare
```shell
rsync -vah $CERD/$name/$name $SSRC --delete
cd $SSRC/$name
```

## Configure
```shell
./configure \
  --prefix=/usr \
  --build=$TUPL \
  --host=$TUPL \
  --target=$TUPL
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
