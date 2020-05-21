# sed
## Chroot
### Configure
`--disable-acl` is used to prevent the following warning:

```
configure: WARNING: libacl development library was not found or not usable.
```

as acl isn't needed for chroot sed.

^ OLD

The new chroot sed has both attr and acl support, and it warns about:

```C
/home/glaucus/toolchain/bin/../lib/gcc/x86_64-glaucus-linux-musl/10.1.0/../../../../x86_64-glaucus-linux-musl/bin/ld: warning: libattr.so.1, needed by /home/glaucus/toolchain/bin/../lib/gcc/x86_64-glaucus-linux-musl/10.1.0/../../../../lib/libacl.so, not found (try using -rpath or -rpath-link)
```
which can be ignored as chroot sed will still find both libattr and libacl in
`/toolchain/lib` (check with ldd), but to remove this warning we add
`LIBS=-lattr` to configure.
