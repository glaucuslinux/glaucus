set +h
umask 022
export LC_ALL=POSIX
export PATH=/toolchain/bin:/usr/bin
unset CFLAGS CXXFLAGS LDFLAGS
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT='[%F %T] '
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
