set +h
umask 022
export LC_ALL=POSIX
export PATH=/toolchain/bin/ccache:/toolchain/bin:/usr/lib/ccache/bin:/usr/bin
unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MAKEFLAGS
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT='[%F %T] '
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
