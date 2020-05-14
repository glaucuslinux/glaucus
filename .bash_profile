exec /usr/bin/env -i \
  HOME=/home/glaucus \
  PATH=/home/glaucus/toolchain/bin/ccache:/home/glaucus/toolchain/bin:/usr/lib64/ccache:/usr/bin \
  TERM=xterm-256color \
  PS1='[\[\033[0;41m\]glaucus@\h\[\033[0m\]:\[\033[1m\]\w\[\033[0m\]]$ ' \
  /usr/bin/bash
