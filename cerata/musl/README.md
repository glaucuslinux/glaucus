# musl

## Name
musl

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://git.musl-libc.org/cgit/musl

## Cyst

## Description
An implementation of the standard library functionality described in the ISO C
and POSIX standards, plus common extensions, intended for use on Linux-based
systems

## Licenses
* BSDv2
* LGPLv2.1+
* MIT
* PD

## Prepare Toolchain
```shell
mkdir -v $TBLD/$name
cd $TBLD/$name
```

## Configure Toolchain
```shell
$CERD/$name/$name/configure \
  CROSS_COMPILE=$TUPL- \
  --prefix=$TOOL/$TUPL \
  --syslibdir=/usr/lib \
  --target=$TUPL \
  --disable-wrapper \
  --disable-static
```

```shell
sudo rm -fv Makefile /usr/lib/ld-$name-$ARCH.so.1
cp -av $CERD/$name/$name/Makefile .
sed 's/$(INSTALL) -D -l/sudo &/' \
  -i Makefile
```

## Build Toolchain
```shell
make
```

## Install Toolchain
```shell
make \
  install
```

## Prepare
```shell
mkdir -v $SBLD/$name
cd $SBLD/$name
```

## Configure
```shell
$CERD/$name/$name/configure \
  CFLAGS="$CFLAGSNOLTO" \
  --prefix=/usr \
  --syslibdir=/usr/lib \
  --target=$TUPL \
  --host=$TUPL \
  --build=$TUPL \
  --disable-wrapper \
  --disable-static
```

```shell
rm -fv Makefile
cp -av $CERD/$name/$name/Makefile .
sed 's/ $(libdir)\/libc.so/ libc.so/' \
  -i Makefile
```

## Build
```shell
make
```

## Install
```shell
make \
  DESTDIR=$SCER/$name/sac \
  install-libs
```

```shell
install -dv $SCER/$name/sac/usr/bin
cd $SCER/$name/sac/usr/bin
ln -fsv ../lib/ld-$name-$ARCH.so.1 ldd
```

```shell
cd ../lib
$STRIP -v Scrt1.o crt1.o crti.o crtn.o rcrt1.o
```
