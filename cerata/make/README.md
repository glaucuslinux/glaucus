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
