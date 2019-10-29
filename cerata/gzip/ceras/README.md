# gzip

## Chroot

### Prepare
Don't exclude .git from gnulib as gzip checks for its submodules when 
bootstrapping

### Configure
`gzip`'s bootstrap is a bit sensitive to what $AUTOPOINT it uses, therefore
we rely on the host's `/usr/bin/autopoint` from the official GNU Gettext, and
the rest ($MSGFMT, $MSGMERGE and $XGETTEXT) from `gettext-tiny`.

Another solution to this is to build `gzip` before `gettext-tiny`, but that's
not preferred.

Check if there's a better way to disable werror from configure/Makefile, instead
of config.status
