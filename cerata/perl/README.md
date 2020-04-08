# perl

## Chroot

### Configure
clearlinux uses threaded perl

There's no such option as `--host`, plus `--target` is the suggested way by
`perl-cross`, and target order is after prefix not before it

perl/texinfo still show missing EXTERN.h

perl doesn't even configure with `-fdata-sections` when optimizing for size:
```C
Checking integer capacity of nv ... unknown
Guessing byte order ... unknown
ERROR: Cannot check byte order without known uvsize
ERROR: configure --mode=target failed
```
