exec /usr/bin/env -i \
  HOME=/home/glaucus \
  PATH=/toolchain/bin/ccache:/toolchain/bin:/usr/lib/ccache/bin:/usr/bin \
  TERM=xterm-256color \
  PS1='[\033[0;41mglaucus@\h\033[0m:\033[1m\w\033[0m]$ ' \
  /usr/bin/bash
