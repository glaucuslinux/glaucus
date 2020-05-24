# bash
## System
### Configure
Don't use `--with-curses` as it's only needed if the system has an inadequate or
incomplete termcap database, which is not the case with `netbsd-curses`. Also
when using `--with-curses` we need to add `-lcurses -lterminfo` to LDFLAGS
when configuring bash.

Don't use `--with-installed-readline` as bash's configure script detects other
alternatives as "old" readlines and doesn't use them (e.g. `libedit` and
`editline`).
