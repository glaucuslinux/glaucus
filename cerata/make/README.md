# make

## Chroot
Needs host `automake` to build properly

### Prepare
The git version of make needs gnulib because:
  1- autoreconf -vfi gives an error about missing lib/Makefile.in
  2- to shorten build time since ./bootstrap will clone gnulib every build

A fix to switch back to the host's `/usr/bin/ls` because `mdate-sh` depends on
its months output.

Another fix for find_in_given_path() until it's fixed by upstream

### Configure
Don't treat all warnings as errors

`--without-guile` is needed or this will happen:
```
/home/glaucus/toolchain/bin/../lib/gcc/x86_64-pc-linux-musl/9.3.0/../../../../x86_64-pc-linux-musl/bin/ld: cannot find -lguile-2.2
/home/glaucus/toolchain/bin/../lib/gcc/x86_64-pc-linux-musl/9.3.0/../../../../x86_64-pc-linux-musl/bin/ld: cannot find -lgc
collect2: error: ld returned 1 exit status
make[1]: *** [Makefile:1293: make] Error 1
make[1]: Leaving directory '/home/glaucus/temporary/chroot/builds/make'
make: *** [Makefile:1442: all-recursive] Error 1
```
