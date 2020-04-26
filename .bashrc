set +h &&

umask 022 &&

export LC_ALL=POSIX &&
export PATH=/toolchain/bin/ccache:/toolchain/bin:/usr/lib64/ccache:/usr/bin:/usr/bin/core_perl &&

unset CFLAGS &&
unset CPPFLAGS &&
unset CXXFLAGS &&
unset LDFLAGS &&
unset MAKEFLAGS
