# e2fsprogs

## Name
e2fsprogs

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs

## Cysts
* musl
* mawk

## Description
The standard utilities for ext2/ext3/ext4 filesystems

## Licenses
* BSDv3
* GPLv2+
* LGPLv2+
* MIT

## Prepare
```shell
rsync -vah $CERD/$name/$name $SSRC --delete
cd $SSRC/$name
```

```shell
patch -p1 -i $CERD/$name/patches/$name.patch
```

## Configure
```shell
CFLAGS="$CFLAGS -I$GLAD/usr/include" \
LIBS=-L$GLAD/usr/lib \
./configure \
  --prefix=/usr \
  --build=$TUPL \
  --host=$TUPL \
  --target=$TUPL \
  --enable-symlink-install \
  --enable-elf-shlibs \
  --disable-bsd-shlibs \
  --disable-testio-debug \
  --disable-debugfs \
  --disable-imager \
  --disable-resizer \
  --disable-defrag \
  --enable-fsck \
  --disable-uuidd \
  --disable-mmp \
  --disable-tdb \
  --disable-nls \
  --disable-fuse2fs
  ```

## Build
```shell
make
```

## Install
```shell
for dir in lib/blkid lib/e2p lib/et lib/ext2fs lib/uuid; do
  cd $dir

  install -dv $SCER/$name/sac/usr/share/man/man3
  make \
    DESTDIR=$SCER/$name/sac \
    install-strip

  cd ../..
done
```

```shell
install -Dv e2fsck/e2fsck misc/blkid misc/chattr misc/fsck misc/lsattr \
  misc/mke2fs misc/tune2fs -t $SCER/$name/sac/usr/bin
```

```shell
cd $SCER/$name/sac/usr/bin
ln -fsv e2fsck fsck.ext4
ln -fsv mke2fs mkfs.ext4
```

```shell
sed 's/\/home\/glaucus\/system//' \
  -i compile_et
```

```shell
cd ../lib
rm -fv libblkid.a libcom_err.a libe2p.a libext2fs.a libuuid.a
```
