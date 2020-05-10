# dash
## chroot
### configure
we have no use for `--with-libedit` in chroot because the main user shell is
`oksh` and `dash` will only be used for running scripts and not as an
interactive user shell.

Then again specifying `--with-libedit` doesn't actually depend on `libedit` so
we'll use it either way?
