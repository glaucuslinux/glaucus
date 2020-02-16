# binutils

## Cross
### Cross Configure
no need for --build and --host (set to gnu) as the configure script is smart
enough to detect them

GNU's gold linker doesn't like musl, as it refuses to build without
enabling PIE support, and bloats things up after enabling PIE support
and yet manages to still fail:

<https://github.com/NixOS/nixpkgs/issues/49071>

`--disable-gold` is the default option, only ld is built

`--enable-lto` is enabled by default

`--enable-plugins` is on by default as it's needed for largefile? (it's also
needed when building gold)

`--enable-64-bit-bfd` is enabled by default for 64 bit targets, as it's only
intended for enabling 64-bit support on 32-bit (and smaller) hosts

`--enable-64-bit-archive` is enabled by default for 64 bit targets as it's
only intended for enabling 64-bit support on 32-bit (and smaller) hosts

`--enable-deterministic-archives` because:

<https://stackoverflow.com/questions/49211308/deterministic-mode-in-ranlib-in-gnu-utilities>

`--disable-werror` is on by default so no need to add it

Added --with-lib-path from LFS for better separation from the host

### Install
The symlink from lib64 to lib has already been created in prepare, also
install-strip doesn't work with readline.

## Native
### Native Configure
Added --with-lib-path from LFS for better separation from the host

GNU's gold linker doesn't like musl, as it refuses to build without
enabling PIE support, and bloats things up after enabling PIE support
and yet manages to still fail:

<https://github.com/NixOS/nixpkgs/issues/49071>

Be careful as CPPFLAGS isn't honored, but CFLAGS is!

## System
### System Configure
binutils enables plugins support by default
