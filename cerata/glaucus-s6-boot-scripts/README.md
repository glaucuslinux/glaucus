# glaucus-s6-boot-scripts

## Name
glaucus-s6-boot-scripts

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://github.com/firasuke/glaucus-s6-boot-scripts

## Cysts
* musl
* skalibs
* execline
* s6
* utmps
* s6-linux-init
* s6-rc

## Description
s6 boot scripts for glaucus

## License
* ISC

## Install
```shell
rsync -vah $CERD/$name/$name/etc $SCER/$name/sac --delete
rsync -vah $CERD/$name/$name/usr $SCER/$name/sac --delete
```

```shell
LD_LIBRARY_PATH=$GLAD/usr/lib \
$GLAD/usr/bin/s6-rc-compile $SCER/$name/sac/etc/s6/compiled \
  $SCER/$name/sac/etc/s6/source
```
