# sed
## Chroot
### Configure
`--disable-acl` is used to prevent the following warning:

```
configure: WARNING: libacl development library was not found or not usable.
```

as acl isn't needed for chroot sed.
