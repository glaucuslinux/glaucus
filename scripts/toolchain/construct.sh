#!/usr/bin/dash -ex

construct() {
  for ceras in $@; do
    . $CERD/$(echo $ceras | sed s/_.//)/ceras
    prepare_toolchain && configure_toolchain && build_toolchain && \
      install_toolchain
  done
}

# Order is honored, as linux should come first because installing kernel headers
# after musl is installed will just clear the entire headers directory. So
# either build linux first and install its headers, which is the preferred
# method as there's no good reason not to, or build it after musl and manually
# copying the header files to their destination instead of running make install.
#
# musl, isl and zstd should only be built with the static gcc_1
toolchain='linux
binutils
gmp mpfr mpc
gcc_1
musl
isl
zstd
gcc_2'

construct $toolchain
