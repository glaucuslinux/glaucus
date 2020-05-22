# libedit
used as a drop-in replacement for readline

## System

### Configure
`--enable-widec` is deprecated as wide-character/UTF-8 is now always enabled.

In the system `adjust` script, the use of `idirafter` instead of `isystem`
causes this to fail with:

```C
In file included from //temporary/system/sources/libedit/src/el.h:50,
                 from //temporary/system/sources/libedit/src/chared.c:51:
//temporary/system/sources/libedit/src/chartype.h:46:3: error: #error wchar_t must store ISO 10646 characters
   46 |  #error wchar_t must store ISO 10646 characters
      |   ^~~~~
make[4]: *** [Makefile:514: chared.lo] Error 1
```
