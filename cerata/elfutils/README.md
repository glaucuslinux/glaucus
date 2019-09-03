# elfutils

## Name
elfutils

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://sourceware.org/git/elfutils.git

## Cyst
* musl

## Description
A collection of utilities and libraries to read, create and modify ELF binary
files, find and handle DWARF debug data, symbols, thread state and stacktraces
for processes and core files on GNU/Linux


## License
* GPLv3+

## Prepare
```shell
rsync -vah $CERD/$name/$name $SSRC --delete
cd $SSRC/$name
```

## Configure
```shell
autoreconf -vfi
./configure \
  --prefix=/usr \
  --program-prefix=eu- \
  --build=$TUPL \
  --host=$TUPL \
  --target=$TUPL \
  --disable-symbol-versioning \
  --disable-werror \
  --disable-nls
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
