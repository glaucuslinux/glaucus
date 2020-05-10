# dash
## chroot
### configure
we have no use for `--with-libedit` in chroot because the main user shell is
`oksh` and `dash` will only be used for running scripts and not as an
interactive user shell.
