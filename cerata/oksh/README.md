# oksh
## Configure
Don't specify `-lcurses` when using it alongside `netbsd-curses` as it'll auto-
magically find `-lterminfo` and link with it and get everything working (similar
to `bash` that doesn't use curses and uses terminfo only which is smaller than
curses).
