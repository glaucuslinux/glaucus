set +h
umask 022
export LC_ALL=POSIX
export PATH=/home/glaucus/toolchain/bin:/usr/bin
unset CFLAGS CXXFLAGS CPPFLAGS
PROMPT_COMMAND='history -a'
