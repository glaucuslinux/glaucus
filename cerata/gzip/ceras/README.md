# gzip

## Chroot

Don't exclude .git from gnulib as gzip checks for its submodules when 
bootstrapping

Check if there's a better way to disable werror from configure/Makefile, instead
of config.status

`gzip` has to be built before `gettext-tiny` due to `gzip`'s bootstrap not
working correctly with `gettext-tiny`.
