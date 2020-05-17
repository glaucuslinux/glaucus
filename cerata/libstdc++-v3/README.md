# libstdc++-v3

## Native

### Configure
Don't disable static support because it's needed by both native binutils and
GCC:
```
configure:5081: checking whether g++ accepts -static-libstdc++ -static-libgcc
configure:5098: x86_64-glaucus-linux-musl-g++ -o conftest -g -O2   -static-libstdc++ -static-libgcc conftest.cpp  >&5
| #error -static-libstdc++ not implemented
```

libstdc++-v3 is inside gcc's tree and is being built by default after
enabling the c++ language support.

libc++ has some performance regressions so it's not being used:

<http://lists.llvm.org/pipermail/cfe-dev/2016-July/049814.html>

We also don't have any use for libstdcxx-pch plus it takes up a lot of
space, so it's being disabled

Still thinking about separately building libstdcxx-v3, but we'll see.

`--disable-werror` is the default here
