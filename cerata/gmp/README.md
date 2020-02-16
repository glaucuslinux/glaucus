# gmp
## Cross
### Cross Configure
mini-gmp has less memory footprint and is smaller than GMP but is slower (up
to 10 times slower in some cases). You should never install mini-gmp as
applications can either include `mini-gmp.c` or compile it and use the
declarations in `mini-gmp.h`

gmp's configure script is stupid and won't accept target alone if we're
cross-compiling; hence, both host needs to be added, and be given the same
value of target which is $TUPL, and build which is given the value of $GUPL to
indicate that we're cross-compiling. (The easiest solution would be to remove
build/host/target alltogether, but meh...)

`--with-sysroot=$GLAD` was added to get the same effect when passing sysroot
to GCC's configure script while using the in tree gmp.

## Native
### Native Configure
No need to specify `--build` as its smart enough to detect it

For now it builds fine without `--enable-cxx` as it errors about not being
able to detect our $TUPL-g++ compiler which is weird

Adding LD_LIBRARY_PATH is necessary if we intend to include cxx support for
gmp when building GCC, which is still questionable as to why cxx support is
needed for gmp when being used in a toolchain. Note that LDFLAGS -L and rpath
won't work here. This is done to fix Error Relocating libgcc_s.so and stdcxx.
