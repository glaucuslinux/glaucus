# bin86

## Name
binutils

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://sourceware.org/git/binutils-gdb.git

## Cyst
* musl

## Description
The GNU assembler, linker and binary utilities necessary to assemble and manipulate binary and object files

## Licenses
* FDLv1.3+
* GPLv2+
* GPLv3+
* LGPLv2.1+
* LGPLv3+
* PD

## Prepare Toolchain
```shell
rsync -vah $CERD/$name/$name-gdb/ $TSRC/$name --delete
mkdir -v $TBLD/$name
cd $TBLD/$name
```

## Configure Toolchain
```shell
$TSRC/$name/configure \
  --prefix=$TOOL \
  --target=$TUPL \
  --enable-lto \
  --disable-nls \
  --with-sysroot=$TOOL/$TUPL \
  --with-lib-path=$TOOL/lib \
  --disable-multilib \
  --disable-gdb
```

```shell
make \
  configure-host
```

## Build Toolchain
```shell
make
```

## Install Toolchain
```shell
make \
  install-strip
```
