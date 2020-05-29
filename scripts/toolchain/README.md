# Toolchain Scripts

## Variables
Although ARCH should be x86-64, some packages won't build successfully
without x86_64, so the main approach is to use x86-64 whenever possible
and switch to x86_64 once an error occurs

Decided to go with quadruplets for tuples,
Replaced unknown with pc because it's shorter and more expressive

glaucus directory

glaucus toolchain

cerata is for storing upstream sources and glaucus' recipe format
logs contains log files for both System and Toolchain
scripts contains all scripts
temporary is where all the magic happens ;)

Where the sources reside away from upstream repo clones

The system wide symlink to the toolchain

$CRSS should be searched first
`/usr/bin/core_perl` resolves the pod2man related error until perl is added

It's highly recommended that MAKEFLAGS value stays at -j1 for now as any
higher value might cause weird problems (segfaults included). 

## Prepare
Prepare for building

to ensure the sanity of the toolchain on x86-64 hosts before installation

## Run
Build both cross and native (comment native to disable building it)
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
# Toolchain Scripts

## Variables

This script should not run before cross's run.sh!

don't add export to this as it's a local variable only

Variables pointing to executables are sorted alphabetically
Also, notice how AR, NM and RANLIB here aren't using LTO (the -gcc- wrappers)

The basic four all pointing to the sysroot of the toolchain. The sysroot here
should be honored and should remove the need for explicitly specifying sysroot
whenever compiling a ceras.

The rest of binutils

## Other
`--build`, `--host` and `--target` are all equal to `x86_64-pc-linux-musl`,
since this we're building a native toolchain.

Order is honored, as linux should come first because the kernel needs to
expose an Application Programming Interface (API) for musl to use, furthermore
installing kernel headers after musl is installed will just clear the entire
headers directory. So either build linux first and install its headers, which
is the preferred method as there's no good reason not to, or build it after
musl and manually copying the header files to their destination instead of
running make install, which is what most LFS inspired distributions do (which
is weird considering they're mostly not using `make headers` and they have
rsync installed).

Sometimes either `configure_native` or `build_native` (or even both) don't exist
hence a check was added to verify that they exist before executing them.
