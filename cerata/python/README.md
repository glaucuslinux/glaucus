# python

## Chroot

### Configure
Cross-compiling python requires both `--build` and `--host`

`--with-ensurepip` is equivalent to `--with-ensurepip=yes` and
`--with-ensurepip=upgrade"

Don't use `--with-universal-arch` because it's only for older systems and on OSX
regardless of its vallue (64-bit or intel-64). Also, this option is only valid
when ``--enable-universalsdk`` is specified:

<https://svn.python.org/projects/python/trunk/Mac/README>

## System

### Build
An ignored error shows (possibly due to building out of tree?):
```C
find build -type f -a ! -name '*.gc??' -exec rm -f {} ';'
find: 'build': No such file or directory
make[2]: [Makefile:1775: clean] Error 1 (ignored)
```
