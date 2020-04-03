# patch
## Chroot
### Configure
`--disable-xattr` is used to prevent the following warning:

```
configure: WARNING: libattr development library was not found or not usable.
```

as extended attributes aren't needed for chroot patch.
