# gcc
## Cross
### Cross Prepare
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

### Cross Configure
According to the GCC wiki, this is the 'difficult way' and is 'not 
recommended'; however, it's the only way to get the latest GCC to build
with the latest upstream prerequisites:

<https://gcc.gnu.org/wiki/InstallingGCC>

Since we're using the latest upstream repository, it's common to find some
options in some configure scripts that do nothing or have been removed. The
latest updated reference for GCC configuration options is the following link:

<https://gcc.gnu.org/install/configure.html>

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

<https://gcc.gnu.org/wiki/InstallingGCC>

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

<https://gcc.gnu.org/ml/gcc-patches/2018-04/msg01225.html>

--disable-libmudflap is also not relevant as the mudflap run time
checker was removed starting from GCC 4.9:

<https://gcc.gnu.org/gcc-4.9/changes.html>

The first pass of GCC can be built easily without isl (isl isn't
required to build GCC, simply pass --without-isl to get rid of the
warnings in config.log).

PPL, CLooG and OpenScop aren't needed for the latest Graphite to work,
as only ISL is required.

GNU's gold linker doesn't like musl, as it refuses to build without
enabling PIE support, and bloats things up after enabling PIE support
and yet manages to still fail:

<https://github.com/NixOS/nixpkgs/issues/49071>

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
### Native Prepare
Curated and cleaned modifications to GCC's source that are still relevant

This should point to the linker

Since we're only building for x86-64

Further optimizing the linker's path

This (and a similar command `touch $TOOL/include/limits.h`) will cause
cross GCC to not detect the custom installed prerequisites; hence, adding a
limits.h is only done for native GCC. This step is done in the end due to
having to cd to the upper directory.

### Native Configure
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

<https://gcc.gnu.org/ml/gcc-patches/2018-04/msg01225.html>

--disable-libmudflap is also not relevant as the mudflap run time
checker was removed starting from GCC 4.9:

<https://gcc.gnu.org/gcc-4.9/changes.html>

According to the GCC wiki, this is the 'difficult way' and is 'not 
recommended'; however, it's the only way to get the latest GCC to build
with the latest upstream prerequisites:

<https://gcc.gnu.org/wiki/InstallingGCC>

The first pass of GCC can be built easily without isl (isl isn't
required to build GCC, simply pass --without-isl to get rid of the
warnings in config.log).

PPL, CLooG and OpenScop aren't needed for the latest Graphite to work,
as only ISL is required.

GNU's gold linker doesn't like musl, as it refuses to build without
enabling PIE support, and bloats things up after enabling PIE support
and yet manages to still fail:

<https://github.com/NixOS/nixpkgs/issues/49071>

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

<http://lists.llvm.org/pipermail/cfe-dev/2016-July/049814.html>

We also don't have any use for libstdcxx-pch plus it takes up a lot of
space, so it's being disabled

Still thinking about separately building libstdcxx-v3, but we'll see.

## System
### System Build
Doesn't build with `-flto`:
```C
/temporary/system/builds/gcc/./gcc/xgcc -B/temporary/system/builds/gcc/./gcc/ -B/usr/x86_64-pc-linux-musl/bin/ -B/usr/x86_64-pc-linux-musl/lib/ -isystem /usr/x86_64-pc-linux-musl/include -isystem /usr/x86_64-pc-linux-musl/sys-include    -O2  -g -O2 -pipe -fopenmp -g0 -Ofast -fmodulo-sched -fmodulo-sched-allow-regmoves -fgcse-sm -fgcse-las -fira-loop-pressure  -fgraphite-identity -floop-nest-optimize -floop-parallelize-all -fmerge-all-constants -fdevirtualize-at-ltrans -fno-semantic-interposition -fvariable-expansion-in-unroller -flto -ftracer -funroll-loops -s -fno-common -fno-plt -march=x86-64 -DIN_GCC    -W -Wall -Wno-narrowing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition  -isystem ./include   -fpic -mlong-double-80 -DUSE_ELF_SYMVER  -g -DIN_LIBGCC2 -fbuilding-libgcc -fno-stack-protector  -shared -nodefaultlibs -Wl,--soname=libgcc_s.so.1 -Wl,--version-script=libgcc.map -o ./libgcc_s.so.1.tmp -g -O2 -pipe -fopenmp -g0 -Ofast -fmodulo-sched -fmodulo-sched-allow-regmoves -fgcse-sm -fgcse-las -fira-loop-pressure -fgraphite-identity -floop-nest-optimize -floop-parallelize-all -fmerge-all-constants -fdevirtualize-at-ltrans -fno-semantic-interposition -fvariable-expansion-in-unroller -flto -ftracer -funroll-loops -s -fno-common -fno-plt -march=x86-64 -B./ _muldi3_s.o _negdi2_s.o _lshrdi3_s.o _ashldi3_s.o _ashrdi3_s.o _cmpdi2_s.o _ucmpdi2_s.o _clear_cache_s.o _trampoline_s.o __main_s.o _absvsi2_s.o _absvdi2_s.o _addvsi3_s.o _addvdi3_s.o _subvsi3_s.o _subvdi3_s.o _mulvsi3_s.o _mulvdi3_s.o _negvsi2_s.o _negvdi2_s.o _ctors_s.o _ffssi2_s.o _ffsdi2_s.o _clz_s.o _clzsi2_s.o _clzdi2_s.o _ctzsi2_s.o _ctzdi2_s.o _popcount_tab_s.o _popcountsi2_s.o _popcountdi2_s.o _paritysi2_s.o _paritydi2_s.o _powisf2_s.o _powidf2_s.o _powixf2_s.o _mulhc3_s.o _mulsc3_s.o _muldc3_s.o _mulxc3_s.o _divhc3_s.o _divsc3_s.o _divdc3_s.o _divxc3_s.o _bswapsi2_s.o _bswapdi2_s.o _clrsbsi2_s.o _clrsbdi2_s.o _fixunssfsi_s.o _fixunsdfsi_s.o _fixunsxfsi_s.o _fixsfdi_s.o _fixdfdi_s.o _fixxfdi_s.o _fixunssfdi_s.o _fixunsdfdi_s.o _fixunsxfdi_s.o _floatdisf_s.o _floatdidf_s.o _floatdixf_s.o _floatundisf_s.o _floatundidf_s.o _floatundixf_s.o _divdi3_s.o _moddi3_s.o _divmoddi4_s.o _udivdi3_s.o _umoddi3_s.o _udivmoddi4_s.o _udiv_w_sdiv_s.o sfp-exceptions_s.o addtf3_s.o divtf3_s.o multf3_s.o negtf2_s.o subtf3_s.o unordtf2_s.o fixtfsi_s.o fixunstfsi_s.o floatsitf_s.o floatunsitf_s.o fixtfdi_s.o fixunstfdi_s.o floatditf_s.o floatunditf_s.o fixtfti_s.o fixunstfti_s.o floattitf_s.o floatuntitf_s.o extendsftf2_s.o extenddftf2_s.o extendxftf2_s.o trunctfsf2_s.o trunctfdf2_s.o trunctfxf2_s.o getf2_s.o letf2_s.o eqtf2_s.o _divtc3_s.o _multc3_s.o _powitf2_s.o enable-execute-stack_s.o unwind-dw2_s.o unwind-dw2-fde-dip_s.o unwind-sjlj_s.o unwind-c_s.o emutls_s.o libgcc.a -lc && rm -f ./libgcc_s.so && if [ -f ./libgcc_s.so.1 ]; then mv -f ./libgcc_s.so.1 ./libgcc_s.so.1.backup; else true; fi && mv ./libgcc_s.so.1.tmp ./libgcc_s.so.1 && (echo "/* GNU ld script"; echo "   Use the shared library, but some functions are only in"; echo "   the static library.  */"; echo "GROUP ( libgcc_s.so.1 -lgcc )" ) > ./libgcc_s.so
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: error in /tmp/libgcc_s.so.1.tmp.HEDoIj.ltrans0.ltrans.o(.eh_frame); no .eh_frame_hdr table will be created
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: error: /tmp/libgcc_s.so.1.tmp.HEDoIj.ltrans0.ltrans.o: size of section .ctors is not multiple of address size
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: final link failed: bad value
collect2: error: ld returned 1 exit status
make[2]: *** [Makefile:992: libgcc_s.so] Error 1
make[2]: Leaving directory '/temporary/system/builds/gcc/x86_64-pc-linux-musl/libgcc'
make[1]: *** [Makefile:12331: all-target-libgcc] Error 2
make[1]: Leaving directory '/temporary/system/builds/gcc'
make: *** [Makefile:955: all] Error 2
```

Doesn't build with `-flto -ffat-lto-objects`:
```C
{ /temporary/system/builds/gcc/./gcc/nm -pg  _muldi3_s.o _negdi2_s.o _lshrdi3_s.o _ashldi3_s.o _ashrdi3_s.o _cmpdi2_s.o _ucmpdi2_s.o _clear_cache_s.o _trampoline_s.o __main_s.o _absvsi2_s.o _absvdi2_s.o _addvsi3_s.o _addvdi3_s.o _subvsi3_s.o _subvdi3_s.o _mulvsi3_s.o _mulvdi3_s.o _negvsi2_s.o _negvdi2_s.o _ctors_s.o _ffssi2_s.o _ffsdi2_s.o _clz_s.o _clzsi2_s.o _clzdi2_s.o _ctzsi2_s.o _ctzdi2_s.o _popcount_tab_s.o _popcountsi2_s.o _popcountdi2_s.o _paritysi2_s.o _paritydi2_s.o _powisf2_s.o _powidf2_s.o _powixf2_s.o _mulhc3_s.o _mulsc3_s.o _muldc3_s.o _mulxc3_s.o _divhc3_s.o _divsc3_s.o _divdc3_s.o _divxc3_s.o _bswapsi2_s.o _bswapdi2_s.o _clrsbsi2_s.o _clrsbdi2_s.o _fixunssfsi_s.o _fixunsdfsi_s.o _fixunsxfsi_s.o _fixsfdi_s.o _fixdfdi_s.o _fixxfdi_s.o _fixunssfdi_s.o _fixunsdfdi_s.o _fixunsxfdi_s.o _floatdisf_s.o _floatdidf_s.o _floatdixf_s.o _floatundisf_s.o _floatundidf_s.o _floatundixf_s.o _divdi3_s.o _moddi3_s.o _divmoddi4_s.o _udivdi3_s.o _umoddi3_s.o _udivmoddi4_s.o _udiv_w_sdiv_s.o sfp-exceptions_s.o addtf3_s.o divtf3_s.o multf3_s.o negtf2_s.o subtf3_s.o unordtf2_s.o fixtfsi_s.o fixunstfsi_s.o floatsitf_s.o floatunsitf_s.o fixtfdi_s.o fixunstfdi_s.o floatditf_s.o floatunditf_s.o fixtfti_s.o fixunstfti_s.o floattitf_s.o floatuntitf_s.o extendsftf2_s.o extenddftf2_s.o extendxftf2_s.o trunctfsf2_s.o trunctfdf2_s.o trunctfxf2_s.o getf2_s.o letf2_s.o eqtf2_s.o _divtc3_s.o _multc3_s.o _powitf2_s.o enable-execute-stack_s.o unwind-dw2_s.o unwind-dw2-fde-dip_s.o unwind-sjlj_s.o unwind-c_s.o emutls_s.o emutls_s.o; echo %%; \
  cat libgcc.map.in; \
} | mawk -f /temporary/system/sources/gcc/libgcc/mkmap-symver.awk  > tmp-libgcc.map
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/nm: _clear_cache_s.o: no symbols
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/nm: _trampoline_s.o: no symbols
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/nm: __main_s.o: no symbols
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/nm: _ctors_s.o: no symbols
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/nm: _mulhc3_s.o: no symbols
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/nm: _mulsc3_s.o: no symbols
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/nm: _muldc3_s.o: no symbols
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/nm: _mulxc3_s.o: no symbols
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/nm: _divhc3_s.o: no symbols
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/nm: _divsc3_s.o: no symbols
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/nm: _divdc3_s.o: no symbols
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/nm: _divxc3_s.o: no symbols
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/nm: unwind-sjlj_s.o: no symbols
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: error: /tmp/libgcc_s.so.1.tmp.aFcKhf.ltrans0.ltrans.o: size of section .ctors is not multiple of address size
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: final link failed: bad value
collect2: error: ld returned 1 exit status
make[2]: *** [Makefile:992: libgcc_s.so] Error 1
make[2]: Leaving directory '/temporary/system/builds/gcc/x86_64-pc-linux-musl/libgcc'
make[1]: *** [Makefile:12331: all-target-libgcc] Error 2
make[1]: Leaving directory '/temporary/system/builds/gcc'
make: *** [Makefile:955: all] Error 2
```

Shouldn't be built with `-Ofast` or `-O3` for MPFR and ISL (other cerata will
fail with symbols not being found in libstdc++).

For example, lbzip2 errors when built with OFast/O3-built GCC (contents of
config.log):
```C
Error relocating /usr/lib/libstdc++.so.6: _ZNSi6ignoreEl: symbol not found
Error relocating /usr/lib/libstdc++.so.6: _ZNSt13basic_istreamIwSt11char_traitsIwEE6ignoreEl: symbol not found
Error relocating /usr/lib/libstdc++.so.6: _ZNSi6ignoreEl: symbol not found
Error relocating /usr/lib/libstdc++.so.6: _ZNSt13basic_istreamIwSt11char_traitsIwEE6ignoreEl: symbol not found
Error relocating /usr/lib/libstdc++.so.6: _ZNSi6ignoreEl: symbol not found
Error relocating /usr/lib/libstdc++.so.6: _ZNSt13basic_istreamIwSt11char_traitsIwEE6ignoreEl: symbol not found
Error relocating /usr/lib/libstdc++.so.6: _ZNSi6ignoreEl: symbol not found
Error relocating /usr/lib/libstdc++.so.6: _ZNSt13basic_istreamIwSt11char_traitsIwEE6ignoreEl: symbol not found
Error relocating /usr/lib/libstdc++.so.6: _ZNSi6ignoreEl: symbol not found
Error relocating /usr/lib/libstdc++.so.6: _ZNSt13basic_istreamIwSt11char_traitsIwEE6ignoreEl: symbol not found
configure:4712: error: in `/temporary/system/builds/lbzip2':
configure:4714: error: C compiler cannot create executables
```

Doesn't build with ``:
```C
during RTL pass: sched2
/temporary/system/sources/gcc/libgcc/libgcc2.c: In function '__lshrti3':
/temporary/system/sources/gcc/libgcc/libgcc2.c:427:1: internal compiler error: Segmentation fault
  427 | }
      | ^
Please submit a full bug report,
with preprocessed source if appropriate.
See <https://gcc.gnu.org/bugs/> for instructions.
make[2]: *** [Makefile:498: _lshrdi3.o] Error 1
make[2]: Leaving directory '/temporary/system/builds/gcc/x86_64-pc-linux-musl/libgcc'
make[1]: *** [Makefile:12331: all-target-libgcc] Error 2
make[1]: Leaving directory '/temporary/system/builds/gcc'
make: *** [Makefile:955: all] Error 2
```

Doesn't build with `-flto`.
Doesn't build with `-flto -ffat-lto-objects`
Builds without `-flto` but is unable to build `lbzip2` due to missing symbols in libstdc++

GCC builds with CFLAGS=$CFLAGSNOLTO and CXXFLAGS=$CFLAGSFAT, but it fails to build lbzip2
when built like that

GCC builds with CFLAGS=$CFLAGSNOLTO and CXXFLAGS=$CFLAGSFATNOOFAST but fails to build
lbzip2

GCC builds with CFLAGS and CXXFLAGS equal to $CFLAGSNOIPANOLTONOTLS and it builds lbzip2

GCC builds with CFLAGS=$CFLAGSNOIPANOLTONOTLS and CXXFLAGS=$CFLAGSFATNOIPANOTLS but it
doesn't build lbzip2

GCC builds with CFLAGS=$CFLAGSNOIPANOLTO and CXXFLAGS=$CFLAGSNOIPANOLTO and builds lbzip2

GCC buils with CFLAGS=$CFLAGSNOLTO and CXXFLAGS=$CFLAGSNOIPANOLTO and builds lbzip2 (best)
