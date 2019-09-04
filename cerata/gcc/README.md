# gcc

## Name
gcc

## Version
svn

## Release
1

## Architecture
* x86-64

## URL
https://gcc.gnu.org/git/gcc/trunk

## Cysts

## Description
The GNU Compiler Collection

## Licenses
* Apachev2.0
* FDLv1.3+
* GPLv2+
* GPLv3+
* LGPLv2.1+
* LGPLv3+
* MIT

## Prepare
```shell
rsync -vah $CERD/$name/trunk/ $TSRC/$name --delete
cd $TSRC/$name/$name/config
```

```shell
for file in i386/linux.h i386/linux64.h linux.h; do
  sed 's/\/lib/\/usr&/' \
    -i $file

  echo "
#undef STANDARD_STARTFILE_PREFIX_1
#define STANDARD_STARTFILE_PREFIX_1 \"$TOOL/lib/\"

#undef STANDARD_STARTFILE_PREFIX_2
#define STANDARD_STARTFILE_PREFIX_2 \"\"" >> $file
done
```

```shell
sed '/m64/s/lib64/lib/' \
  -i i386/t-linux64
```

```shell
sed "/MUSL_DYNAMIC_LINKER64/s/\/dev\/null/\/usr\/lib\/ld-musl-$ARCH.so.1/" \
  -i linux.h
```

```shell
mkdir -v $TBLD/$ceras
case $ceras in
  gcc_2)
    cd ..

    cat limitx.h glimits.h limity.h > $(dirname $($TUPL-gcc \
      -print-libgcc-file-name))/include-fixed/limits.h
    ;;
esac
cd $TBLD/$ceras
```

## Configure
```shell
case $ceras in
  gcc_1)
    $TSRC/$name/configure \
      --prefix=$TOOL \
      --target=$TUPL \
      --with-local-prefix=$TOOL \
      --with-native-system-header-dir=/include \
      --disable-shared \
      --disable-multilib \
      --disable-threads \
      --with-arch=x86-64 \
      --enable-languages=c \
      --disable-libada \
      --disable-libsanitizer \
      --disable-libssp \
      --disable-libquadmath \
      --disable-libgomp \
      --disable-libvtv \
      --disable-nls \
      --disable-decimal-float \
      --with-gmp=$TOOL \
      --with-mpfr=$TOOL \
      --with-mpc=$TOOL \
      --without-isl \
      --with-sysroot=$TOOL/$TUPL \
      --without-headers \
      --with-newlib \
      --disable-libatomic \
      --disable-libitm \
      --disable-libstdcxx
    ;;
  gcc_2)
    LDFLAGS="-Wl,-rpath,$TOOL/lib" \
    $TSRC/$name/configure \
      --prefix=$TOOL \
      --target=$TUPL \
      --with-local-prefix=$TOOL \
      --with-native-system-header-dir=/include \
      --disable-static \
      --disable-multilib \
      --with-arch=x86-64 \
      --disable-bootstrap \
      --enable-languages=c,c++ \
      --disable-libsanitizer \
      --disable-libssp \
      --disable-libquadmath \
      --disable-libvtv \
      --disable-nls \
      --with-gmp=$TOOL \
      --with-mpfr=$TOOL \
      --with-mpc=$TOOL \
      --with-isl=$TOOL \
      --with-zstd=$TOOL \
      --with-sysroot=$TOOL/$TUPL \
      --with-linker-hash-style=gnu \
      --disable-symvers \
      --disable-libatomic \
      --disable-libstdcxx-pch
    ;;
esac
```

## Build
```shell
case $ceras in
  gcc_1)
    make \
      all-gcc \
      all-target-libgcc
    ;;
  gcc_2)
    make
    ;;
esac
```

## Install
```shell
case $ceras in
  gcc_1)
    make \
      install-gcc \
      install-target-libgcc
    ;;
  gcc_2)
    make \
      install-strip

    cd $TOOL/bin
    ln -fsv $TUPL-gcc cc
    ;;
esac
```
