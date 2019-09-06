# linux

## Name
linux

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux

## Cyst

## Description
The Linux kernel and modules

## License
* GPLv2

## Prepare Toolchain
```shell
mkdir -v $TBLD/$name
cd $CERD/$name/$name
```

```shell
make \
  mrproper
make \
  O=$TBLD/$name \
  ARCH=$ARCH \
  headers_check
```

## Configure Toolchain

## Build Toolchain

## Install Toolchain
```shell
make \
  O=$TBLD/$name \
  ARCH=$ARCH \
  INSTALL_HDR_PATH=$TOOL/$TUPL \
  headers_install
```

```shell
find $TOOL/$TUPL/include \( -name ..install.cmd -o -name .install \) -delete
```

## Prepare
```shell
mkdir -v $SBLD/$name
rsync -vah $CERD/$name/glaucus.config $SBLD/$name/.config --delete
```

```shell
cd $CERD/$name/$name
make \
  mrproper
```

## Configure
```shell
make \
  O=$SBLD/$name \
  oldconfig
make \
  O=$SBLD/$name \
  prepare
```

## Build
```shell
make \
  O=$SBLD/$name
```

## Install
```shell
install -Dv $SBLD/$name/arch/x86/boot/bzImage $SCER/$name/sac/boot/vmlinuz
install -v $SBLD/$name/System.map $SCER/$name/sac/boot
```
