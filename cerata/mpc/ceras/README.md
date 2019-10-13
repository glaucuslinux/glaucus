# mpc

## Cross

### Configure
no need for --build and --host (set to gnu) as the configure script is smart
enough to detect them

`--with-sysroot=$CRSS/$TUPL` can't be used here as it'll prevent libtool from
finding libmpfr and libgmp in $CRSS/lib (it'll look in $CRSS/$TUPL/$CRSS/lib
which is wrong). It seems that `--with-mpfr` and `--with-gmp` don't override
the value of sysroot when searching for their relative paths, instead their
values are appended which isn't desirable.

Again don't use `--with-gmp` and `--with-mpfr` here as it'll wrongly detect
or even not detect at all libgmp and libmpfr. So use LDFLAGS rpath instead.
