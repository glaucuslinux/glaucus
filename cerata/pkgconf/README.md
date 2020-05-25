# pkgconf
## Chroot
### Configure
`--with-sysroot` has to be specified and given a value of `$GLAD` because our
cross/native toolchain won't list a sysroot with `gcc --print-sysroot`.
## System
### Configure
No need to specify `--with-system-libdir` and `--with-system-includedir` when
prefix exists.

Also `pkgconf` doesn't respect PKG_CONFIG_PATH when `--with-pkg-config-dir` is
already set when upon configuring its sources.
### Build
Doesn't build with `-fno-common`:
```C
./libtool: 1: eval: Syntax error: "|" unexpected
make: *** [Makefile:673: libpkgconf.la] Error 2
```
