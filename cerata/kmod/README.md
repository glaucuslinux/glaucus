# kmod
`--with-rootprefix` was removed in version 11 so we either have to patch kmod
to look for modules in `/usr/lib` by default instead of `/lib` or rely on flags
(like `-b`?) instead.
