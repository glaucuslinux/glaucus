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
