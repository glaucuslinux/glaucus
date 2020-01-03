# zlib-ng
## System
### Build
Doesn't build with `-fno-common`:
```C
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: deflate_quick.o (symbol from plugin): in function `deflate_quick':
(.text+0x0): multiple definition of `static_ltree'; trees.o (symbol from plugin):(.text+0x0): first defined here
collect2: error: ld returned 1 exit status
make: *** [Makefile:233: example] Error 1
```
