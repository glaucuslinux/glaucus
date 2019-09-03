#!/usr/bin/dash -ex

construct() {
  for ceras in $@; do
    . $CERD/$(echo $ceras | sed s/_.//)/ceras
    prepare_toolchain && configure_toolchain && build_toolchain && \
      install_toolchain
  done
}

# order is honored
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
