# gcc

## Cross

### Prepare
Curated and cleaned modifications to GCC's source that are up to date and
still relevant. Using these modifications will remove the need to adjust the
cross-compilation toolchain's compiler specs file.

Don't use a dummy limits.h in $TOOL/include, it's just stupid...

This should point to the linker

This points to the libc's libraries installed in $TOOL (it's not for
pointing to the linker). Also the forward slash `/` is needed in the end of
the path.

Since we're only building for x86-64

Further optimizing the linker's path

### Configure
According to the GCC wiki, this is the 'difficult way' and is 'not 
recommended'; however, it's the only way to get the latest GCC to build
with the latest upstream prerequisites:

https://gcc.gnu.org/wiki/InstallingGCC

Since we're using the latest upstream repository, it's common to find some
options in some configure scripts that do nothing or have been removed. The
latest updated reference for GCC configuration options is the following link:

https://gcc.gnu.org/install/configure.html

A list of supported options follows; `configure --help` may list other
options, but those not listed in the link above, may not work and should not
normally be used.

The configuration options below are ordered in the same order as they appear
in the link above.

Since the first pass of GCC will only be used to build musl, support
for everything else is being disabled. Optimizations will also be 
disabled in the near future (-g0 and -O0) to further speed up the build
process.

`LDFLAGS="-Wl,-rpath,$TOOL/lib"` is needed as we're building GCC the
'difficult way' according to:

https://gcc.gnu.org/wiki/InstallingGCC

No need for --build and --host (set to gnu) as the configure script is
smart enough to detect them. I also believe that the common consumption of
GCC's configure script being stupid for not correctly detecting build/host
stems from the fact that some of its prerequisites and subdirs have funky
host/build detection (yes, I'm looking at you gmp, mpc and libiberty...).

--with-local-prefix helps further move away from the host

--with-native-system-header will cause GCC to search dirname inside the
system root specified by --with-sysroot; hence, /include will suffice.

So it'll be read as $(--with-sysroot)$(--with-native-system-header)
(notice how a trailing slash is added to --with-native-system-header).

Misconfiguring the native header directory is quite easy and common and
will most likely result in the following error:
cc1: error: no include path in which to search for stdc-predef.h

It's better to use `--enable-threads=single` in place of
`--disable-threads` as the latter is just an alias for the former.

It's better to use `--enable-tls=no` in place of `--disable-tls` as the
latter is just an alias for the former.

`--disable-bootstrap` as this is known to work.

There's no need to add support for the C++ language here.

--disable-libmpx isn't relevant as MPX support was removed from GCC
starting from GCC 9:
https://gcc.gnu.org/ml/gcc-patches/2018-04/msg01225.html

--disable-libmudflap is also not relevant as the mudflap run time
checker was removed starting from GCC 4.9:
https://gcc.gnu.org/gcc-4.9/changes.html

The first pass of GCC can be built easily without isl (isl isn't
required to build GCC, simply pass --without-isl to get rid of the
warnings in config.log).

PPL, CLooG and OpenScop aren't needed for the latest Graphite to work,
as only ISL is required.

GNU's gold linker doesn't like musl, as it refuses to build without
enabling PIE support, and bloats things up after enabling PIE support
and yet manages to still fail:
https://github.com/NixOS/nixpkgs/issues/49071

`--disable-compressed-debug-sections` in GCC's configure script isn't for
GCC but for binutils gas and ld

Host's zlib isn't needed here as it's only pass 1 (doesn't really matter).

Please don't consider disabling optimizations for this build as it'll bloat
the entire toolchain to a whopping 1.7 GiB... (and it won't speed up boot time
as it's inspired by LFS, so this means that this cross GCC builds musl and
the final binutils and the final GCC).

### Install
for the sake of correctness, the install script complains about missing
file/directory, so here's a fix even though it's an ignored error...

## Native

### Prepare
Curated and cleaned modifications to GCC's source that are still relevant

This should point to the linker

Since we're only building for x86-64

Further optimizing the linker's path

This (and a similar command `touch $TOOL/include/limits.h`) will cause
cross GCC to not detect the custom installed prerequisites; hence, adding a
limits.h is only done for native GCC. This step is done in the end due to
having to cd to the upper directory.

### Configure
--with-local-prefix helps further move away from the host

--with-native-system-header will cause GCC to search dirname inside the
system root specified by --with-sysroot; hence, /include will suffice.

So it'll be read as $(--with-sysroot)$(--with-native-system-header)
(notice how a trailing slash is added to --with-native-system-header).

Misconfiguring the native header directory is quite easy and common and
will most likely result in the following error:
cc1: error: no include path in which to search for stdc-predef.h

--disable-libmpx isn't relevant as MPX support was removed from GCC
starting from GCC 9:
https://gcc.gnu.org/ml/gcc-patches/2018-04/msg01225.html

--disable-libmudflap is also not relevant as the mudflap run time
checker was removed starting from GCC 4.9:
https://gcc.gnu.org/gcc-4.9/changes.html

According to the GCC wiki, this is the 'difficult way' and is 'not 
recommended'; however, it's the only way to get the latest GCC to build
with the latest upstream prerequisites:
https://gcc.gnu.org/wiki/InstallingGCC

The first pass of GCC can be built easily without isl (isl isn't
required to build GCC, simply pass --without-isl to get rid of the
warnings in config.log).

PPL, CLooG and OpenScop aren't needed for the latest Graphite to work,
as only ISL is required.

GNU's gold linker doesn't like musl, as it refuses to build without
enabling PIE support, and bloats things up after enabling PIE support
and yet manages to still fail:
https://github.com/NixOS/nixpkgs/issues/49071

Since the first pass of GCC will only be used to build musl, support
for everything else is being disabled. Optimizations will also be 
disabled in the near future (-O0 and -g0) to further speed up the build
process.

We're relying on the internal zlib here since using our custom native zlib
will result in an ignored info/gcc.info error. Although the error can be
ignored, a clean log file is still much preferred over and ignored error.

libstdc++-v3 is inside gcc's tree and is being built by default after
enabling the c++ language support.

libc++ has some performance regressions so it's not being used:
http://lists.llvm.org/pipermail/cfe-dev/2016-July/049814.html

We also don't have any use for libstdcxx-pch plus it takes up a lot of
space, so it's being disabled

Still thinking about separately building libstdcxx-v3, but we'll see.
