# pkgconf
## System
### Build
Doesn't build with `-fno-common`:
```C
./libtool: 1: eval: Syntax error: "|" unexpected
make: *** [Makefile:673: libpkgconf.la] Error 2
```
