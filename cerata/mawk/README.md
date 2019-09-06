# mawk

## Name
mawk

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://github.com/ThomasDickey/mawk-snapshots

## Cyst
* musl

## Description
An interpreter for the AWK Programming Language faster than gawk

## License
* GPLv2+

## Prepare
```shell
mkdir -v $SBLD/$ceras
cd $SBLD/$ceras
```

## Configure
```shell
case $ceras in
  mawk_1)
    AWK=mawk \
    CFLAGS="$CFLAGSNOOPENMP" \
    $CERD/$name/$name-snapshots/configure \
      --prefix=/usr \
      --build=$TUPL \
      --host=$TUPL \
      --target=$TUPL
    ;;
  mawk_2)
    CFLAGS="$CFLAGSNOOPENMP" \
    $CERD/$name/$name-snapshots/configure \
      --prefix=/usr \
      --build=$TUPL \
      --host=$TUPL \
      --target=$TUPL
    ;;
esac
```

## Build
```shell
make
```

## Install
```shell
rsync -vah $CERD/$name/$name-snapshots/man . --delete
make \
  DESTDIR=$SCER/$ceras/sac \
  install
```

```shell
cd $SCER/$ceras/sac/usr/bin
ln -fsv $name awk
```
