# make

## Chroot

### Prepare
needs gnulib because:
  1- autoreconf -vfi gives an error about missing lib/Makefile.in
  2- to shorten build time since ./bootstrap will clone gnulib every build

A fix for find_in_given_path() until it's fixed by upstream

### Configure
Don't treat all warnings as errors
