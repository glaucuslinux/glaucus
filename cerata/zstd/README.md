# zstd

## Native

### Build
Most of the configuration is done here as envrionmental variables are passed to
make since there's no configure script.

double check if gmp was built correctly before starting to build the second
stage of GCC, as it would report missing header files like string.h, which
can be solved by adding CPPFLAGS/LDFLAGS but isn't the case here (not the
real problem).

we also need to find a way to disable the static version of the library
without relying on cmake...

### Install
Prefix is configured here.
