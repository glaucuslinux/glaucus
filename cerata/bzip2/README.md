# bzip2

## Name
bzip2

## Version
git

## Release
1

## Architecture
* x86-64

## URL
git://sourceware.org/git/bzip2

## Cyst
* musl

## Description
A freely available, patent free, high-quality data compressor

## License
* BSDv3

## Prepare
```shell
rsync -vah $CERD/$name/$name $SSRC --delete
cd $SSRC/$name
```

## Configure
```shell
sed 's/$(PREFIX)\/man/$(PREFIX)\/share\/man/' \
  -i Makefile
```

## Build
```shell
make \
  CC="$CC" \
  CFLAGS="$CFLAGS -fpic -D_FILE_OFFSET_BITS=64" \
  -f Makefile-libbz2_so

  make \
    clean

  make \
    AR=$AR \
    CC="$CC" \
    RANLIB=$RANLIB \
    CFLAGS="$CFLAGS -fpic -D_FILE_OFFSET_BITS=64" \
    LDFLAGS="$LDFLAGS"
```

## Install
```shell
install -dv $SCER/$name/sac/usr/share/man/man1
make \
  PREFIX=$SCER/$name/sac/usr \
  install
```
