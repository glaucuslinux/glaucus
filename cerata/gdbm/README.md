# gdbm
## System
### Build
Doesn't build with `-fno-common`:
```C
In file included from /sources/gdbm/gdbm-1.18.1/src/gdbmtool.c:28:
/usr/include/sys/termios.h:1:2: warning: #warning redirecting incorrect #include <sys/termios.h> to <termios.h> [-Wcpp]
    1 | #warning redirecting incorrect #include <sys/termios.h> to <termios.h>
      |  ^~~~~~~
  CC       var.o
  CC       util.o
  CC       input-rl.o
/sources/gdbm/gdbm-1.18.1/src/input-rl.c: In function 'input_init':
/sources/gdbm/gdbm-1.18.1/src/input-rl.c:167:21: warning: assignment to 'int (*)(const char *, int)' from incompatible pointer type 'int (*)(void)' [-Wincompatible-pointer-types]
  167 |   rl_pre_input_hook = pre_input;
      |                     ^
  CCLD     gdbmtool
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: parseopt.o (symbol from plugin): in function `print_option':
(.text+0x0): multiple definition of `parseopt_program_args'; gdbmtool.o (symbol from plugin):(.text+0x0): first defined here
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: parseopt.o (symbol from plugin): in function `print_option':
(.text+0x0): multiple definition of `parseopt_program_doc'; gdbmtool.o (symbol from plugin):(.text+0x0): first defined here
collect2: error: ld returned 1 exit status
make[3]: *** [Makefile:656: gdbmtool] Error 1
make[3]: Leaving directory '/temporary/system/builds/gdbm/src'
make[2]: *** [Makefile:499: all] Error 2
make[2]: Leaving directory '/temporary/system/builds/gdbm/src'
make[1]: *** [Makefile:464: all-recursive] Error 1
make[1]: Leaving directory '/temporary/system/builds/gdbm'
make: *** [Makefile:396: all] Error 2
```
