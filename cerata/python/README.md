# python

## Chroot

### Configure
Cross-compiling python requires both `--build` and `--host`

`--with-ensurepip` is equivalent to `--with-ensurepip=yes` and
`--with-ensurepip=upgrade"

## System

### Build
An ignored error shows (possibly due to building out of tree?):
```C
find build -type f -a ! -name '*.gc??' -exec rm -f {} ';'
find: 'build': No such file or directory
make[2]: [Makefile:1775: clean] Error 1 (ignored)
```
