# Toolchain Scripts

## Variables
Cross-compilation only related variables, these will only be called when
building the cross-compilation toolchain

don't export this as it's only local

## Other
--build and --host are similar here since these tools will be built on a GNU
machine (the host) and will run on it as well.

--target will be $TUPL since we're using this cross-compilation toolchain to
build the native toolchain of the chroot (which has --host and --target set to
$TUPL).

A single stage binutils build is used in cross

Then GCC prerequisites are built including gmp, mpfr and mpc as they're
required by both stages of GCC.

You could build isl and zstd before the first stage of GCC is built and that's
perfectly normal, but building them directly before the second stage of GCC
help indicate that they're only going to be used by the second stage of GCC,
plus by placing them (isl and zstd) after the first stage of GCC and musl we
could tell that both gcc_1 and musl built fine, as both isl and zstd would
complain if the first stage of GCC and musl were misconfigured (and that's
very easy, trust me...).

A misconfigured musl for example (passing --prefix=$CRSS instead of
--prefix=$CRSS/$TUPL would cause isl to not detect libgmp.so installed in
$CRSS/lib and gcc_2 to not detct all of libgmp.so, libmpfr.so and libmpc.so 
(and of course libisl.so and libzstd.so, but they won't even build correctly
unless you've passed them before gcc_1 and musl) even though it would build
fine if the build was attempted with gmp/mpfr/mpc just before gcc_1 and musl).

In addition, a misconfigured GCC as well, would cause zstd to not detect some
header files it requires, so be careful.

The above errors would also occur if gmp wasn't built and installed correctly,
so make sure gmp is perfectly fine before attempting anything. (GCC refers to
gmp/mpfr/mpc collectively as gmplibs).

Here we're building all of GCC's stages 1 & 2 prerequisites to ensure that
they're built with the host's gcc and not the first stage of GCC which is
supposed to only build musl (mainly talking about isl and zstd as they're
not required for stage 1).

libstdc++ is within gcc, and it takes configuration options passed to gcc's
configure script so there's no need to build it separately like LFS
