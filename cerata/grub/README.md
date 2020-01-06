# grub
## System
### Build
Doesn't build with `-fopenmp` as it doesn't seem to find libgomp and it doesn't
accept libgomp.a:
```C
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: cannot find -lgomp
```

Doesn't build `-flto`:
```C
/ld:toolchain //libtmp//gccgrub/-scriptx86_64--pccheck.ALCngL.ltrans0.ltrans.o-:linux -inmusl /function9.2.0 /`.argp_parser.'/.:
./<artificial..>:/.(../text+x86_64-0x157)pc-:linux -undefinedmusl /binreference /ldto :` <xstrdup'artificial>
/:(toolchain/lib./text.startupgcc+/x86_640x6c)-pc: -linuxundefined -muslreference /9.2.0to /.`grub_make_system_path_relative_to_its_root./'
../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1a5): collect2: error: ld returned 1 exit status
undefined reference to `argp_state_help'
/toolchain/lib/gcc/x86_64-pcmake[2]: *** [Makefile:4656: grub-mkrelpath] Error 1
make[2]: *** Waiting for unfinished jobs....
-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-script-check.ALCngL.ltrans0.ltrans.o: in function `main':
<artificial>:(.text.startup+0x24): undefined reference to `set_program_name'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x70): undefined reference to `argp_parse'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x94): undefined reference to `grub_util_fopen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xdc): undefined reference to `grub_script_parse'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xf8): undefined reference to `grub_script_execute'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x107): undefined reference to `grub_script_free'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x112): undefined reference to `grub_free'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x122): undefined reference to `grub_script_execute'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x12b): undefined reference to `grub_script_free'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x136): undefined reference to `grub_free'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x17c): undefined reference to `grub_free'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x206): undefined reference to `program_name'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x20c): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x252): undefined reference to `argp_help'
collect2: error: ld returned 1 exit status
make[2]: *** [Makefile:4867: grub-script-check] Error 1
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkpasswd-pbkdf2.EnKFnC.ltrans0.ltrans.o: in function `main':
<artificial>:(.text.startup+0x32): undefined reference to `set_program_name'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x75): undefined reference to `argp_parse'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x8f): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x9c): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xbf): undefined reference to `grub_password_get'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xec): undefined reference to `grub_password_get'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x129): undefined reference to `grub_util_fopen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x190): undefined reference to `_gcry_digest_spec_sha512'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1c7): undefined reference to `grub_crypto_pbkdf2'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1fc): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x234): undefined reference to `grub_snprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x2e8): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x30c): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x354): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x392): undefined reference to `grub_util_error'
collect2: error: ld returned 1 exit status
make[2]: *** [Makefile:4644: grub-mkpasswd-pbkdf2] Error 1
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-editenv.aFFahD.ltrans0.ltrans.o: in function `write_envblk':
<artificial>:(.text+0x11): undefined reference to `grub_util_fopen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3d): undefined reference to `grub_util_file_sync'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6f): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x90): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xb1): undefined/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mklayout.pfHbGK.ltrans0.ltrans.o: in function `argp_parser':
<artificial>:(.text+0x25): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x45): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mklayout.pfHbGK.ltrans0.ltrans.o: in function `write_keymaps':
<artificial>:(.text+0x354): undefined reference to `grub_util_error'
/toolchain/lib reference to/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x36a): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mklayout.pfHbGK.ltrans0.ltrans.o: in function `main':
<artificial>:(.text.startup+0x11): undefined reference to `set_program_name'
/toolchain/lib /gcc`grub_util_error/x86_64'
-pc/toolchain-linux/lib-musl/gcc/9.2.0/x86_64/.-pc-.linux/-.musl.//9.2.0.././.././..x86_64-/.pc-./linux-..musl//x86_64bin/-pcld:-linux <-muslartificial>/bin:(/ld.:text.startup +/0x63tmp)/: grub-undefined editenv.aFFahD.ltrans0.ltrans.o:reference  into  function`argp_parse `'
help_filter'/toolchain:
/lib<artificial/gcc>:/x86_64(.-pc-linux-musltext+/9.2.00xdf)/.: ./undefined ..reference /.to ./`xasprintf..'
/x86_64/toolchain-pc/lib-linux/gcc-musl/x86_64/bin-pc/ld-linux: -musl<artificial/9.2.0/>:.(../text.startup.+.0x86)/.: ./undefined. reference./ x86_64to- pc`-grub_util_fopenlinux'-
musl/toolchain/bin//libld/:gcc /x86_64/tmp-pc/grub-linux-editenv.aFFahD.ltrans0.ltrans.o-: musl/in 9.2.0/function ..`grub_util_create_envblk_file':
<artificial>:(.text+0x105): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x118): undefined reference to `xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x129): undefined reference to `grub_util_fopen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1ab): undefined reference to `grub_util_file_sync'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x206): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x219): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x23a): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x25b): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-editenv.aFFahD.ltrans0.ltrans.o: in function `open_envblk_file':
<artificial>:(.text+0x293): undefined reference to `grub_util_fopen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2e1): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x316): undefined reference to `grub_envblk_open'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x33f): undefined reference to `grub_util_fopen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin//../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xae): undefined reference to `grub_util_fopen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x155): undefined reference to `grub_util_error'
collect2: error: ld returned 1 exit status
make[2]: *** [Makefile:4575: grub-mklayout] Error 1
ld: <artificial>:(.text+0x385): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3b9): undefined reference to `grub_envblk_open'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3d4): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3f5): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x416): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x437): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-editenv.aFFahD.ltrans0.ltrans.o: in function `argp_parser':
<artificial>:(.text+0x483): undefined reference to `argp_state_help'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4a2): undefined reference to `verbosity'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-editenv.aFFahD.ltrans0.ltrans.o: in function `main':
<artificial>:(.text.startup+0x18): undefined reference to `set_program_name'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x5b): undefined reference to `argp_parse'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x197): undefined reference to `grub_envblk_delete'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1a7): undefined reference to `grub_envblk_delete'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1b7): undefined reference to `grub_envblk_delete'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1c7): undefined reference to `grub_envblk_delete'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1d7): undefined reference to `grub_envblk_delete'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-editenv.aFFahD.ltrans0.ltrans.o:<artificial>:(.text.startup+0x1e7): more undefined references to `grub_envblk_delete' follow
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-editenv.aFFahD.ltrans0.ltrans.o: in function `main':
<artificial>:(.text.startup+0x270): undefined reference to `grub_envblk_close'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x28d): undefined reference to `grub_envblk_iterate'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x296): undefined reference to `grub_envblk_close'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x330): undefined reference to `grub_envblk_set'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x365): undefined reference to `grub_envblk_set'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x3a9): undefined reference to `grub_envblk_set'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x3e0): undefined reference to `grub_envblk_set'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x417): undefined reference to `grub_envblk_set'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-editenv.aFFahD.ltrans0.ltrans.o:<artificial>:(.text.startup+0x44a): more undefined references to `grub_envblk_set' follow
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-editenv.aFFahD.ltrans0.ltrans.o: in function `main':
<artificial>:(.text.startup+0x4a7): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x4b7): undefined reference to `grub_envblk_delete'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x4cc): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x4fa): undefined reference to `program_name'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x500): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x533): undefined reference to `argp_help'
collect2: error: ld returned 1 exit status
make[2]: *** [Makefile:4330: grub-editenv] Error 1
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-fstest.fBpeAg.ltrans0.ltrans.o: in function `crc_hook':
<artificial>:(.text+0x7c): undefined reference to `_gcry_digest_spec_crc32'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-fstest.fBpeAg.ltrans0.ltrans.o: in function `grub_host_open':
<artificial>:(.text+0x9b): undefined reference to `grub_strcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xcf): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-fstest.fBpeAg.ltrans0.ltrans.o: in function `grub_hostfs_close':
<artificial>:(.text+0xea): undefined reference to `grub_util_fd_close'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xf4): undefined reference to `grub_free'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xfd): undefined reference to `grub_free'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-fstest.fBpeAg.ltrans0.ltrans.o: in function `grub_hostfs_read':
<artificial>:(.text+0x12e): undefined reference to `grub_util_fd_seek'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x142): undefined reference to `grub_util_fd_read'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x152): undefined reference to `grub_util_fd_strerror'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x16b): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x182): undefined reference to `grub_util_fd_strerror'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x19b): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-fstest.fBpeAg.ltrans0.ltrans.o: in function `grub_hostfs_open':
<artificial>:(.text+0x1c7): undefined reference to `grub_util_fd_open'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1d9): undefined reference to `grub_malloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1ea): undefined reference to `grub_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x209): undefined reference to `grub_util_get_fd_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x24c): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x255): undefined reference to `grub_free'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x25e): undefined reference to `grub_util_fd_close'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x264): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-fstest.fBpeAg.ltrans0.ltrans.o: in function `grub_hostfs_dir':
<artificial>:(.text+0x2a6): undefined reference to `grub_strcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2f2): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x338): undefined reference to `grub_util_is_directory'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x37f): undefined reference to `grub_memset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3be): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3da): undefined reference to `grub_util_fd_strerror'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3f2): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-fstest.fBpeAg.ltrans0.ltrans.o: in function `cp_hook':
<artificial>:(.text+0x44b): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-fstest.fBpeAg.ltrans0.ltrans.o: in function `cat_hook':
<artificial>:(.text+0x48e): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-fstest.fBpeAg.ltrans0.ltrans.o: in function `hex_hook':
<artificial>:(.text+0x4a6): undefined reference to `hexdump'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-fstest.fBpeAg.ltrans0.ltrans.o: in function `execute_command':
<artificial>:(.text+0x4d4): undefined reference to `grub_command_list'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4da): undefined reference to `grub_named_list_find'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x503): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-fstest.fBpeAg.ltrans0.ltrans.o: in function `argp_parser':
<artificial>:(.text+0x592): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5eb): undefined reference to `verbosity'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x635): undefined reference to `grub_util_fopen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x67d): undefined reference to `grub_zfs_add_key'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x68f): undefined reference to `grub_strtoul'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6dd): undefined reference to `grub_strtoul'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x710): undefined reference to `grub_strtoul'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x747): undefined reference to `grub_puts_'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x755): undefined reference to `grub_password_get'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x766): undefined reference to `grub_strlen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x777): undefined reference to `grub_zfs_add_key'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x798): undefined reference to `grub_canonicalize_file_name'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7d4): undefined reference to `argp_state_help'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x818): undefined reference to `argp_state_help'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x832): undefined reference to `grub_strcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8cc): undefined reference to `argp_state_help'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8df): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8f9): undefined reference to `program_name'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x93e): undefined reference to `program_name'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x98a): undefined reference to `grub_strcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9ab): undefined reference to `grub_strcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9d6): undefined reference to `grub_strcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa01): undefined reference to `grub_strcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa2c): undefined reference to `grub_strcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-fstest.fBpeAg.ltrans0.ltrans.o:<artificial>:(.text+0xa57): more undefined references to `grub_strcmp' follow
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-fstest.fBpeAg.ltrans0.ltrans.o: in function `argp_parser':
<artificial>:(.text+0xb23): undefined reference to `argp_state_help'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-fstest.fBpeAg.ltrans0.ltrans.o: in function `read_file':
<artificial>:(.text+0xb67): undefined reference to `grub_file_open'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xb84): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xbf6): undefined reference to `grub_file_read'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc1b): undefined reference to `grub_file_close'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc36): undefined reference to `grub_device_open'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc5f): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xce3): undefined reference to `grub_disk_read'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd14): undefined reference to `grub_device_close'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd19): undefined reference to `grub_errmsg'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd29): undefined reference to `grub_xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd39): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd4f): undefined reference to `grub_errmsg'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd5c): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd6c): undefined reference to `grub_xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd7c): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd81): undefined reference to `grub_errmsg'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd91): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-fstest.fBpeAg.ltrans0.ltrans.o: in function `cmp_hook':
<artificial>:(.text+0xddc): undefined reference to `grub_memcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xfe2): undefined reference to `grub_xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xff2): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xfff): undefined reference to `grub_errmsg'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1007): undefined reference to `grub_xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1017): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-fstest.fBpeAg.ltrans0.ltrans.o: in function `cmd_cmp':
<artificial>:(.text+0x1039): undefined reference to `grub_util_is_directory'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x109f): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x10c2): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x112b): undefined reference to `grub_util_is_special_file'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x117a): undefined reference to `grub_util_fopen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x11ca): undefined reference to `grub_file_open'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x11e7): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1266): undefined reference to `grub_file_read'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x127d): undefined reference to `grub_file_close'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x12ee): undefined reference to `grub_device_open'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1317): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x137f): undefined reference to `grub_disk_read'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x13a7): undefined reference to `grub_device_close'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x13cb): undefined reference to `grub_errmsg'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x13db): undefined reference to `grub_xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x13eb): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1401): undefined reference to `grub_errmsg'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x140e): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x141e): undefined reference to `grub_xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x142e): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1433): undefined reference to `grub_errmsg'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1443): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1455): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x145b): undefined reference to `grub_util_fd_strerror'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x146e): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x149f): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-fstest.fBpeAg.ltrans0.ltrans.o: in function `grub_mod_fini.lto_priv.1':
<artificial>:(.text+0x15e7): undefined reference to `grub_disk_dev_unregister'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-fstest.fBpeAg.ltrans0.ltrans.o: in function `grub_mod_init.lto_priv.1':
<artificial>:(.text+0x15f7): undefined reference to `grub_disk_dev_register'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-fstest.fBpeAg.ltrans0.ltrans.o: in function `grub_mod_fini.lto_priv.0':
<artificial>:(.text+0x1607): undefined reference to `grub_list_remove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-fstest.fBpeAg.ltrans0.ltrans.o: in function `grub_mod_init.lto_priv.0':
<artificial>:(.text+0x1616): undefined reference to `grub_fs_list'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x161c): undefined reference to `grub_list_push'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-fstest.fBpeAg.ltrans0.ltrans.o: in function `main':
<artificial>:(.text.startup+0x14): undefined reference to `set_program_name'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x4a): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x69): undefined reference to `argp_parse'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x6f): undefined reference to `grub_adler32_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x75): undefined reference to `grub_affs_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x7b): undefined reference to `grub_afs_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x81): undefined reference to `grub_bfs_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x87): undefined reference to `grub_blocklist_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x8d): undefined reference to `grub_btrfs_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x93): undefined reference to `grub_cbfs_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x99): undefined reference to `grub_cpio_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x9f): undefined reference to `grub_cpio_be_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xa5): undefined reference to `grub_crc64_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xab): undefined reference to `grub_cryptodisk_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xb1): undefined reference to `grub_disk_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xb7): undefined reference to `grub_diskfilter_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xbd): undefined reference to `grub_dm_nv_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xc3): undefined reference to `grub_exfat_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xc9): undefined reference to `grub_ext2_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xcf): undefined reference to `grub_f2fs_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xd5): undefined reference to `grub_fat_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xdb): undefined reference to `grub_geli_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xe1): undefined reference to `grub_gzio_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xe7): undefined reference to `grub_hfs_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xed): undefined reference to `grub_hfsplus_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xf3): undefined reference to `grub_hfspluscomp_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xfe): undefined reference to `grub_disk_dev_register'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x108): undefined reference to `grub_fs_list'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x10e): undefined reference to `grub_list_push'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x114): undefined reference to `grub_iso9660_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x11a): undefined reference to `grub_jfs_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x120): undefined reference to `grub_ldm_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x126): undefined reference to `grub_loopback_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x12c): undefined reference to `grub_ls_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x132): undefined reference to `grub_luks_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x138): undefined reference to `grub_lvm_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x13e): undefined reference to `grub_lzopio_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x144): undefined reference to `grub_macbless_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x14a): undefined reference to `grub_mdraid09_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x150): undefined reference to `grub_mdraid09_be_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x156): undefined reference to `grub_mdraid1x_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x15c): undefined reference to `grub_minix_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x162): undefined reference to `grub_minix2_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x168): undefined reference to `grub_minix2_be_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x16e): undefined reference to `grub_minix3_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x174): undefined reference to `grub_minix3_be_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x17a): undefined reference to `grub_minix_be_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x180): undefined reference to `grub_newc_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x186): undefined reference to `grub_nilfs2_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x18c): undefined reference to `grub_ntfs_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x192): undefined reference to `grub_ntfscomp_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x198): undefined reference to `grub_odc_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x19e): undefined reference to `grub_part_acorn_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1a4): undefined reference to `grub_part_amiga_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1aa): undefined reference to `grub_part_apple_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1b0): undefined reference to `grub_part_bsd_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1b6): undefined reference to `grub_part_dfly_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1bc): undefined reference to `grub_part_dvh_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1c2): undefined reference to `grub_part_gpt_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1c8): undefined reference to `grub_part_msdos_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1ce): undefined reference to `grub_part_plan_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1d4): undefined reference to `grub_part_sun_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1da): undefined reference to `grub_part_sunpc_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1e0): undefined reference to `grub_procfs_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1e6): undefined reference to `grub_raid5rec_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1ec): undefined reference to `grub_raid6rec_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1f2): undefined reference to `grub_reiserfs_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1f8): undefined reference to `grub_romfs_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1fe): undefined reference to `grub_sfs_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x204): undefined reference to `grub_squash4_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x20a): undefined reference to `grub_tar_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x210): undefined reference to `grub_testload_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x216): undefined reference to `grub_udf_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x21c): undefined reference to `grub_ufs1_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x222): undefined reference to `grub_ufs1_be_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x228): undefined reference to `grub_ufs2_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x22e): undefined reference to `grub_xfs_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x234): undefined reference to `grub_xnu_uuid_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x23a): undefined reference to `grub_xzio_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x240): undefined reference to `grub_zfs_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x246): undefined reference to `grub_zfscrypt_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x24c): undefined reference to `grub_zfsinfo_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x252): undefined reference to `grub_gcry_init_all'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x269): undefined reference to `grub_env_set'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x2b3): undefined reference to `grub_env_set'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x2e3): undefined reference to `grub_xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x307): undefined reference to `grub_xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x329): undefined reference to `grub_command_list'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x338): undefined reference to `grub_named_list_find'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x366): undefined reference to `grub_free'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x36f): undefined reference to `grub_free'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x392): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x3cd): undefined reference to `grub_ldm_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x3d3): undefined reference to `grub_lvm_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x3d9): undefined reference to `grub_mdraid09_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x3df): undefined reference to `grub_mdraid1x_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x3e5): undefined reference to `grub_diskfilter_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x3eb): undefined reference to `grub_diskfilter_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x3f1): undefined reference to `grub_mdraid09_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x3f7): undefined reference to `grub_mdraid1x_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x3fd): undefined reference to `grub_lvm_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x403): undefined reference to `grub_ldm_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x436): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x468): undefined reference to `grub_env_set'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x489): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x4b7): undefined reference to `grub_device_open'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x4cc): undefined reference to `grub_fs_probe'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x523): undefined reference to `grub_free'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x52d): undefined reference to `grub_free'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x536): undefined reference to `grub_device_close'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x564): undefined reference to `grub_xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x57b): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x58c): undefined reference to `grub_command_list'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x59f): undefined reference to `grub_named_list_find'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x5c3): undefined reference to `grub_free'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x5cd): undefined reference to `grub_free'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x5e0): undefined reference to `grub_gcry_fini_all'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x5e6): undefined reference to `grub_adler32_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x5ec): undefined reference to `grub_affs_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x5f2): undefined reference to `grub_afs_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x5f8): undefined reference to `grub_bfs_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x5fe): undefined reference to `grub_blocklist_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x604): undefined reference to `grub_btrfs_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x60a): undefined reference to `grub_cbfs_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x610): undefined reference to `grub_cpio_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x616): undefined reference to `grub_cpio_be_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x61c): undefined reference to `grub_crc64_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x622): undefined reference to `grub_cryptodisk_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x628): undefined reference to `grub_disk_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x62e): undefined reference to `grub_diskfilter_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x634): undefined reference to `grub_dm_nv_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x63a): undefined reference to `grub_exfat_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x640): undefined reference to `grub_ext2_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x646): undefined reference to `grub_f2fs_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x64c): undefined reference to `grub_fat_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x652): undefined reference to `grub_geli_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x658): undefined reference to `grub_gzio_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x65e): undefined reference to `grub_hfs_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x664): undefined reference to `grub_hfsplus_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x66a): undefined reference to `grub_hfspluscomp_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x675): undefined reference to `grub_disk_dev_unregister'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x680): undefined reference to `grub_list_remove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x686): undefined reference to `grub_iso9660_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x68c): undefined reference to `grub_jfs_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x692): undefined reference to `grub_ldm_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x698): undefined reference to `grub_loopback_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x69e): undefined reference to `grub_ls_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x6a4): undefined reference to `grub_luks_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x6aa): undefined reference to `grub_lvm_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x6b0): undefined reference to `grub_lzopio_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x6b6): undefined reference to `grub_macbless_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x6bc): undefined reference to `grub_mdraid09_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x6c2): undefined reference to `grub_mdraid09_be_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x6c8): undefined reference to `grub_mdraid1x_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x6ce): undefined reference to `grub_minix_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x6d4): undefined reference to `grub_minix2_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x6da): undefined reference to `grub_minix2_be_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x6e0): undefined reference to `grub_minix3_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x6e6): undefined reference to `grub_minix3_be_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x6ec): undefined reference to `grub_minix_be_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x6f2): undefined reference to `grub_newc_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x6f8): undefined reference to `grub_nilfs2_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x6fe): undefined reference to `grub_ntfs_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x704): undefined reference to `grub_ntfscomp_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x70a): undefined reference to `grub_odc_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x710): undefined reference to `grub_part_acorn_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x716): undefined reference to `grub_part_amiga_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x71c): undefined reference to `grub_part_apple_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x722): undefined reference to `grub_part_bsd_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x728): undefined reference to `grub_part_dfly_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x72e): undefined reference to `grub_part_dvh_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x734): undefined reference to `grub_part_gpt_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x73a): undefined reference to `grub_part_msdos_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x740): undefined reference to `grub_part_plan_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x746): undefined reference to `grub_part_sun_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x74c): undefined reference to `grub_part_sunpc_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x752): undefined reference to `grub_procfs_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x758): undefined reference to `grub_raid5rec_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x75e): undefined reference to `grub_raid6rec_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x764): undefined reference to `grub_reiserfs_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x76a): undefined reference to `grub_romfs_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x770): undefined reference to `grub_sfs_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x776): undefined reference to `grub_squash4_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x77c): undefined reference to `grub_tar_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x782): undefined reference to `grub_testload_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x788): undefined reference to `grub_udf_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x78e): undefined reference to `grub_ufs1_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x794): undefined reference to `grub_ufs1_be_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x79a): undefined reference to `grub_ufs2_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x7a0): undefined reference to `grub_xfs_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x7a6): undefined reference to `grub_xnu_uuid_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x7ac): undefined reference to `grub_xzio_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x7b2): undefined reference to `grub_zfs_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x7b8): undefined reference to `grub_zfscrypt_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x7be): undefined reference to `grub_zfsinfo_fini'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x81d): undefined reference to `grub_util_fopen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x8aa): undefined reference to `_gcry_digest_spec_crc32'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x8b3): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x8bf): undefined reference to `_gcry_digest_spec_crc32'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x8d8): undefined reference to `_gcry_digest_spec_crc32'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x8e1): undefined reference to `_gcry_digest_spec_crc32'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x921): undefined reference to `grub_printf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x947): undefined reference to `grub_printf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x96a): undefined reference to `grub_errmsg'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x977): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x989): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x98e): undefined reference to `grub_errmsg'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x99b): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x9a0): undefined reference to `grub_errmsg'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x9ad): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x9bf): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x9e0): undefined reference to `grub_util_error'
collect2: error: ld returned 1 exit status
make[2]: *** [Makefile:4409: grub-fstest] Error 1
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-menulst2cfg.bcdPIk.ltrans0.ltrans.o: in function `grub_legacy_escape':
<artificial>:(.text+0x47): undefined reference to `grub_malloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x97): undefined reference to `grub_strcpy'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa2): undefined reference to `grub_strlen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-menulst2cfg.bcdPIk.ltrans0.ltrans.o: in function `check_option':
<artificial>:(.text+0x122): undefined reference to `grub_strlen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x143): undefined reference to `grub_strncmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-menulst2cfg.bcdPIk.ltrans0.ltrans.o: in function `grub_legacy_parse':
<artificial>:(.text+0x1b8): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x202): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x236): undefined reference to `grub_strncmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x28b): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x30f): undefined reference to `grub_memcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x328): undefined reference to `grub_memcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x343): undefined reference to `grub_memcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x35c): undefined reference to `grub_memcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x374): undefined reference to `grub_memcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-menulst2cfg.bcdPIk.ltrans0.ltrans.o:<artificial>:(.text+0x397): more undefined references to `grub_memcmp' follow
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-menulst2cfg.bcdPIk.ltrans0.ltrans.o: in function `grub_legacy_parse':
<artificial>:(.text+0x3c5): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3fa): undefined reference to `grub_strncmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x444): undefined reference to `grub_strncmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x492): undefined reference to `grub_strncmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4e2): undefined reference to `grub_strncmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x532): undefined reference to `grub_strncmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x582): undefined reference to `grub_xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x600): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7bb): undefined reference to `grub_snprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7c4): undefined reference to `grub_strlen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7d5): undefined reference to `grub_strcpy'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7de): undefined reference to `grub_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x80b): undefined reference to `grub_memset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x869): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8a5): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xaa2): undefined reference to `grub_strtoull'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc0f): undefined reference to `grub_malloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xcbd): undefined reference to `grub_snprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd41): undefined reference to `grub_strtoul'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd48): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd93): undefined reference to `grub_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xe98): undefined reference to `grub_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xee3): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xf0c): undefined reference to `grub_malloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xf50): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xf9d): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1008): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x103b): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x10b2): undefined reference to `grub_strndup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x110b): undefined reference to `grub_strtoul'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1111): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1143): undefined reference to `grub_strlen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1167): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x11b2): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x11cc): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x11e6): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1200): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-menulst2cfg.bcdPIk.ltrans0.ltrans.o:<artificial>:(.text+0x121a): more undefined references to `grub_isspace' follow
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-menulst2cfg.bcdPIk.ltrans0.ltrans.o: in function `grub_legacy_parse':
<artificial>:(.text+0x1362): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x13c2): undefined reference to `grub_strlen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x13d4): undefined reference to `grub_malloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x13e6): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1410): undefined reference to `grub_strlen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x143c): undefined reference to `grub_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x145e): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1472): undefined reference to `grub_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x15f0): undefined reference to `grub_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x162b): undefined reference to `grub_xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x166f): undefined reference to `grub_xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x167d): undefined reference to `grub_free'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1688): undefined reference to `grub_free'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1696): undefined reference to `grub_free'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x16a4): undefined reference to `grub_free'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x16d8): undefined reference to `grub_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1714): undefined reference to `grub_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1866): undefined reference to `grub_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x18c2): undefined reference to `grub_xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x18dc): undefined reference to `grub_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x195d): undefined reference to `grub_strchr'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1969): undefined reference to `grub_strlen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x197f): undefined reference to `grub_malloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x19a9): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x19cc): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x19ea): undefined reference to `grub_strlen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1a3c): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1a52): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1a68): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1a7e): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1a94): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-menulst2cfg.bcdPIk.ltrans0.ltrans.o:<artificial>:(.text+0x1aaa): more undefined references to `grub_isspace' follow
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-menulst2cfg.bcdPIk.ltrans0.ltrans.o: in function `grub_legacy_parse':
<artificial>:(.text+0x1b8c): undefined reference to `grub_strndup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1bbf): undefined reference to `grub_snprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1bf6): undefined reference to `grub_strlen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1c15): undefined reference to `grub_strncmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1c3d): undefined reference to `grub_strndup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1c5c): undefined reference to `grub_strlen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1c84): undefined reference to `grub_strlen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1ca2): undefined reference to `grub_strlen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1cc0): undefined reference to `grub_strlen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1cde): undefined reference to `grub_strlen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1d96): undefined reference to `grub_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1f21): undefined reference to `grub_malloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1fc8): undefined reference to `grub_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1fdd): undefined reference to `grub_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1ff2): undefined reference to `grub_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2007): undefined reference to `grub_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x201c): undefined reference to `grub_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-menulst2cfg.bcdPIk.ltrans0.ltrans.o:<artificial>:(.text+0x2031): more undefined references to `grub_strdup' follow
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-menulst2cfg.bcdPIk.ltrans0.ltrans.o: in function `grub_legacy_parse':
<artificial>:(.text+0x2255): undefined reference to `grub_strncmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2284): undefined reference to `grub_strncmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x22ad): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x22d1): undefined reference to `grub_strncmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2326): undefined reference to `grub_strncmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-menulst2cfg.bcdPIk.ltrans0.ltrans.o: in function `main':
<artificial>:(.text.startup+0x35): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x41): undefined reference to `set_program_name'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x87): undefined reference to `grub_util_fopen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xa7): undefined reference to `grub_util_fopen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x145): undefined reference to `xrealloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x322): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x338): undefined reference to `grub_util_error'
collect2: error: ld returned 1 exit status
make[2]: *** [Makefile:4526: grub-menulst2cfg] Error 1
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-syslinux2cfg.GNGeba.ltrans0.ltrans.o: in function `add_comment':
<artificial>:(.text+0x153): undefined reference to `grub_strlen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x165): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1c5): undefined reference to `grub_strlen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1d8): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1f0): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x215): undefined reference to `grub_strlen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x224): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-syslinux2cfg.GNGeba.ltrans0.ltrans.o: in function `print_escaped.constprop.0':
<artificial>:(.text+0x2c5): undefined reference to `grub_strlen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3d9): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3fa): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-syslinux2cfg.GNGeba.ltrans0.ltrans.o: in function `print_escaped':
<artificial>:(.text+0x535): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x55d): undefined reference to `grub_strlen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x572): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-syslinux2cfg.GNGeba.ltrans0.ltrans.o: in function `cmd_menudefault':
<artificial>:(.text+0x5b4): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-syslinux2cfg.GNGeba.ltrans0.ltrans.o: in function `grub_host_open':
<artificial>:(.text+0x5cb): undefined reference to `grub_strcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5ff): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-syslinux2cfg.GNGeba.ltrans0.ltrans.o: in function `grub_hostfs_close':
<artificial>:(.text+0x61a): undefined reference to `grub_util_fd_close'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x624): undefined reference to `grub_free'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x62d): undefined reference to `grub_free'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-syslinux2cfg.GNGeba.ltrans0.ltrans.o: in function `grub_hostfs_read':
<artificial>:(.text+0x65e): undefined reference to `grub_util_fd_seek'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x672): undefined reference to `grub_util_fd_read'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x682): undefined reference to `grub_util_fd_strerror'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x69b): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6b2): undefined reference to `grub_util_fd_strerror'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6cb): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-syslinux2cfg.GNGeba.ltrans0.ltrans.o: in function `kernel':
<artificial>:(.text+0x6f2): undefined reference to `grub_strlen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x70b): undefined reference to `grub_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x74b): undefined reference to `grub_strcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc78): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc82): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-syslinux2cfg.GNGeba.ltrans0.ltrans.o: in function `cmd_linux':
<artificial>:(.text+0xe44): undefined reference to `grub_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xe84): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xe92): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-syslinux2cfg.GNGeba.ltrans0.ltrans.o: in function `cmd_boot':
<artificial>:(.text+0xeb4): undefined reference to `grub_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xef4): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xf02): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-syslinux2cfg.GNGeba.ltrans0.ltrans.o: in function `cmd_bss':
<artificial>:(.text+0xf24): undefined reference to `grub_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xf64): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xf72): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-syslinux2cfg.GNGeba.ltrans0.ltrans.o: in function `cmd_pxe':
<artificial>:(.text+0xf94): undefined reference to `grub_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xfd4): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xfe2): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-syslinux2cfg.GNGeba.ltrans0.ltrans.o: in function `cmd_fdimage':
<artificial>:(.text+0x1004): undefined reference to `grub_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1044): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1052): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-syslinux2cfg.GNGeba.ltrans0.ltrans.o: in function `cmd_comboot':
<artificial>:(.text+0x1074): undefined reference to `grub_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x10b4): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x10c2): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-syslinux2cfg.GNGeba.ltrans0.ltrans.o: in function `cmd_com32':
<artificial>:(.text+0x10e4): undefined reference to `grub_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1124): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1132): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-syslinux2cfg.GNGeba.ltrans0.ltrans.o: in function `cmd_append':
<artificial>:(.text+0x1154): undefined reference to `grub_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1184): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1192): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-syslinux2cfg.GNGeba.ltrans0.ltrans.o: in function `cmd_default':
<artificial>:(.text+0x11a6): undefined reference to `grub_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x11ba): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-syslinux2cfg.GNGeba.ltrans0.ltrans.o: in function `cmd_menubackground':
<artificial>:(.text+0x11c6): undefined reference to `grub_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-syslinux2cfg.GNGeba.ltrans0.ltrans.o: in function `cmd_localboot':
<artificial>:(.text+0x11f4): undefined reference to `grub_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1234): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1242): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-syslinux2cfg.GNGeba.ltrans0.ltrans.o: in function `cmd_extlabel':
<artificial>:(.text+0x1267): undefined reference to `grub_strlen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1275): undefined reference to `grub_malloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1336): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1343): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-syslinux2cfg.GNGeba.ltrans0.ltrans.o: in function `grub_hostfs_open':
<artificial>:(.text+0x1367): undefined reference to `grub_util_fd_open'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1379): undefined reference to `grub_malloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x138a): undefined reference to `grub_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x13a9): undefined reference to `grub_util_get_fd_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x13ec): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x13f5): undefined reference to `grub_free'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x13fe): undefined reference to `grub_util_fd_close'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1404): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-syslinux2cfg.GNGeba.ltrans0.ltrans.o: in function `label':
<artificial>:(.text+0x1431): undefined reference to `grub_malloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1449): undefined reference to `grub_memset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1452): undefined reference to `grub_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x148d): undefined reference to `grub_free'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1494): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-syslinux2cfg.GNGeba.ltrans0.ltrans.o: in function `grub_hostfs_dir':
<artificial>:(.text+0x14d6): undefined reference to `grub_strcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1522): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1568): undefined reference to `grub_util_is_directory'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x15af): undefined reference to `grub_memset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x15ee): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x160a): undefined reference to `grub_util_fd_strerror'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1622): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-syslinux2cfg.GNGeba.ltrans0.ltrans.o: in function `grub_file_getline':
<artificial>:(.text+0x1646): undefined reference to `grub_malloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x166f): undefined reference to `grub_file_read'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x16ab): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x16e2): undefined reference to `grub_free'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-syslinux2cfg.GNGeba.ltrans0.ltrans.o: in function `cmd_say':
<artificial>:(.text+0x171c): undefined reference to `grub_strlen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1726): undefined reference to `grub_malloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x175d): undefined reference to `grub_strlen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x176e): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x17a3): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-syslinux2cfg.GNGeba.ltrans0.ltrans.o: in function `print':
<artificial>:(.text+0x17e1): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1810): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1832): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-syslinux2cfg.GNGeba.ltrans0.ltrans.o: in function `print_file.isra.0':
<artificial>:(.text+0x1887): undefined reference to `grub_strlen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x198f): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x19b7): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x19f1): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1a15): undefined reference to `grub_strlen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1a52): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1a6b): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-syslinux2cfg.GNGeba.ltrans0.ltrans.o: in function `cmd_timeout':
<artificial>:(.text+0x1a9a): undefined reference to `grub_strtoul'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-syslinux2cfg.GNGeba.ltrans0.ltrans.o: in function `syslinux_parse_real':
<artificial>:(.text+0x1ace): undefined reference to `grub_file_open'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1add): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1af5): undefined reference to `grub_free'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1b18): undefined reference to `grub_strlen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1d18): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1d52): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1d72): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1d8e): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1db0): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1e0a): undefined reference to `grub_strlen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1ed9): undefined reference to `grub_strlen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x20a4): undefined reference to `grub_file_close'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2263): undefined reference to `grub_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x227d): undefined reference to `grub_strlen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x228d): undefined reference to `grub_free'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x22d4): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x240a): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2447): undefined reference to `grub_free'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x24ee): undefined reference to `grub_strlen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x253d): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x254e): undefined reference to `grub_free'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2554): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x256f): undefined reference to `grub_free'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2578): undefined reference to `grub_free'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x257e): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-syslinux2cfg.GNGeba.ltrans0.ltrans.o: in function `syslinux_parse':
<artificial>:(.text+0x261a): undefined reference to `grub_xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2621): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2649): undefined reference to `grub_free'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x266f): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-syslinux2cfg.GNGeba.ltrans0.ltrans.o: in function `cmd_config':
<artificial>:(.text+0x26df): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x26f6): undefined reference to `grub_strndup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2727): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x273e): undefined reference to `grub_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2772): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x27a8): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-syslinux2cfg.GNGeba.ltrans0.ltrans.o: in function `cmd_initrd':
<artificial>:(.text+0x2808): undefined reference to `grub_malloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2823): undefined reference to `grub_strndup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x28b7): undefined reference to `grub_malloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x28ca): undefined reference to `grub_strndup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x28f7): undefined reference to `grub_free'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x28fd): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x291a): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-syslinux2cfg.GNGeba.ltrans0.ltrans.o: in function `print_num':
<artificial>:(.text+0x293e): undefined reference to `grub_snprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2947): undefined reference to `grub_strlen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2969): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2991): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x29b2): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-syslinux2cfg.GNGeba.ltrans0.ltrans.o: in function `config_file':
<artificial>:(.text+0x2a15): undefined reference to `grub_memset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2ab8): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2b02): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2b2a): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2b6f): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2bba): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2bda): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2bf2): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2c1a): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2c5a): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2c85): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2c9c): undefined reference to `grub_strlen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2ccb): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2d19): undefined reference to `grub_free'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2d24): undefined reference to `grub_free'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2d2f): undefined reference to `grub_free'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2d48): undefined reference to `grub_free'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2d84): undefined reference to `grub_free'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-syslinux2cfg.GNGeba.ltrans0.ltrans.o:<artificial>:(.text+0x2d8d): more undefined references to `grub_free' follow
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-syslinux2cfg.GNGeba.ltrans0.ltrans.o: in function `config_file':
<artificial>:(.text+0x2e33): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2e8a): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2eb5): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2eec): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2f17): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2f56): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2f7f): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2fdb): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3006): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3035): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x305d): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x308c): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x30b4): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x30df): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x310a): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3147): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3172): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x31b2): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x31dd): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3216): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3241): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3273): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3297): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x32b6): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x32d1): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x32f2): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x331f): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x333a): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-syslinux2cfg.GNGeba.ltrans0.ltrans.o:<artificial>:(.text+0x335a): more undefined references to `grub_errno' follow
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-syslinux2cfg.GNGeba.ltrans0.ltrans.o: in function `print_config':
<artificial>:(.text+0x3483): undefined reference to `grub_xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x34ae): undefined reference to `grub_xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x34d8): undefined reference to `grub_xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3580): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x35db): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x35eb): undefined reference to `grub_strlen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3621): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3660): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3698): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x36ac): undefined reference to `grub_strcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x36e5): undefined reference to `grub_strcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3731): undefined reference to `grub_strcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3761): undefined reference to `grub_strcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x378d): undefined reference to `grub_strcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-syslinux2cfg.GNGeba.ltrans0.ltrans.o:<artificial>:(.text+0x37b9): more undefined references to `grub_strcmp' follow
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-syslinux2cfg.GNGeba.ltrans0.ltrans.o: in function `print_config':
<artificial>:(.text+0x3823): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3847): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x387c): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x388c): undefined reference to `grub_strlen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x38b9): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x38eb): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3912): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3922): undefined reference to `grub_free'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x392b): undefined reference to `grub_free'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3934): undefined reference to `grub_free'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x39b0): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x39f8): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3a22): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3a3a): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3bd0): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3bfb): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3c1f): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3c6d): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3cbd): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3cef): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3d3d): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3d6f): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3dbd): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3def): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3e0a): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3e37): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3e72): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3e96): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3eba): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3ede): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3ef9): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-syslinux2cfg.GNGeba.ltrans0.ltrans.o:<artificial>:(.text+0x3f14): more undefined references to `grub_errno' follow
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-syslinux2cfg.GNGeba.ltrans0.ltrans.o: in function `write_entry':
<artificial>:(.text+0x3f62): undefined reference to `grub_strlen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3f90): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3fda): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4001): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x403d): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x408a): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x40aa): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x40ca): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x40f1): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4126): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x415e): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4188): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x41ca): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x41fc): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x427c): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x429b): undefined reference to `grub_strtoull'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x42ea): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4314): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4355): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4387): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x43dc): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4531): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x455b): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x45a3): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x45d1): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x45fb): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x460b): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4760): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x47a7): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x47d1): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x482b): undefined reference to `grub_strtoull'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x484b): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x486d): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4897): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x48c5): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x48ec): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4927): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x495e): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x49a1): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x49cb): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x49fe): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4a4c): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4a68): undefined reference to `grub_strlen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4a9a): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4acb): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4af9): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4b34): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4b5f): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4ba1): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4bcc): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4bfb): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4c43): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4c93): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4cae): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4cd0): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4cfa): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4d6d): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4ef3): undefined reference to `grub_strtoul'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4f4b): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4f78): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5094): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x50c3): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x50d3): undefined reference to `grub_strlen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5103): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x513a): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x516a): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x51fd): undefined reference to `grub_strtoul'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x525b): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x529a): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x52e5): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x530f): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x53cf): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x54cf): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5504): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x551c): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x554b): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x558b): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x55b5): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5685): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x56a8): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x56ca): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x56ea): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5705): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5720): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5749): undefined reference to `grub_strtoul'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x575c): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5794): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x57ee): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5832): undefined reference to `grub_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x585d): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x589a): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x58c7): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x58e2): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5902): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x591d): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5a63): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5a97): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5ac3): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5ae0): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5b1c): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5b4a): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5b5c): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5b71): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5b8c): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5ba7): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5bbe): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-syslinux2cfg.GNGeba.ltrans0.ltrans.o:<artificial>:(.text+0x5bf0): more undefined references to `grub_errno' follow
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-syslinux2cfg.GNGeba.ltrans0.ltrans.o: in function `write_entry':
<artificial>:(.text+0x5c18): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5c28): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5c43): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5c5e): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5cd2): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5f4f): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5f9e): undefined reference to `grub_strlen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x611e): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6135): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x619c): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x61be): undefined reference to `grub_strcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x61d6): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6262): undefined reference to `grub_strlen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x62b5): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x62c8): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x62db): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-syslinux2cfg.GNGeba.ltrans0.ltrans.o: in function `argp_parser':
<artificial>:(.text+0x6447): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6462): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6488): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x64ae): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x64da): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-syslinux2cfg.GNGeba.ltrans0.ltrans.o:<artificial>:(.text+0x6504): more undefined references to `xstrdup' follow
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-syslinux2cfg.GNGeba.ltrans0.ltrans.o: in function `grub_mod_fini.lto_priv.1':
<artificial>:(.text+0x6657): undefined reference to `grub_disk_dev_unregister'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-syslinux2cfg.GNGeba.ltrans0.ltrans.o: in function `grub_mod_init.lto_priv.1':
<artificial>:(.text+0x6667): undefined reference to `grub_disk_dev_register'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-syslinux2cfg.GNGeba.ltrans0.ltrans.o: in function `grub_mod_fini.lto_priv.0':
<artificial>:(.text+0x6677): undefined reference to `grub_list_remove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-syslinux2cfg.GNGeba.ltrans0.ltrans.o: in function `grub_mod_init.lto_priv.0':
<artificial>:(.text+0x6686): undefined reference to `grub_fs_list'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x668c): undefined reference to `grub_list_push'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-syslinux2cfg.GNGeba.ltrans0.ltrans.o: in function `main':
<artificial>:(.text.startup+0x18): undefined reference to `set_program_name'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x77): undefined reference to `argp_parse'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x91): undefined reference to `grub_init_all'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x9b): undefined reference to `grub_fs_list'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xa1): undefined reference to `grub_list_push'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xac): undefined reference to `grub_disk_dev_register'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xb7): undefined reference to `grub_canonicalize_file_name'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xd3): undefined reference to `xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xf3): undefined reference to `grub_canonicalize_file_name'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x10f): undefined reference to `xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x126): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x157): undefined reference to `grub_canonicalize_file_name'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x173): undefined reference to `xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x211): undefined reference to `grub_util_fopen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x2f3): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x31e): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x323): undefined reference to `grub_errmsg'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x330): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x3a1): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x3c4): undefined reference to `grub_util_error'
collect2: error: ld returned 1 exit status
make[2]: *** [Makefile:4914: grub-syslinux2cfg] Error 1
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkimage.alCOld.ltrans0.ltrans.o: in function `SzAlloc':
<artificial>:(.text+0x65): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkimage.alCOld.ltrans0.ltrans.o: in function `finish_reloc_translation_raw.isra.0.lto_priv.0':
<artificial>:(.text+0xc0): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x15f): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkimage.alCOld.ltrans0.ltrans.o: in function `add_module':
<artificial>:(.text+0x1ee): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x291): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2a9): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2ef): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x388): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3b9): undefined reference to `grub_util_get_path'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3dd): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkimage.alCOld.ltrans0.ltrans.o: in function `put_section32.isra.0':
<artificial>:(.text+0x15ed): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkimage.alCOld.ltrans0.ltrans.o: in function `put_section64.isra.0':
<artificial>:(.text+0x1771): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkimage.alCOld.ltrans0.ltrans.o: in function `locate_sections64.isra.0':
<artificial>:(.text+0x24a5): undefined reference to `grub_xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x24b5): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkimage.alCOld.ltrans0.ltrans.o: in function `grub_mkimage_generate_elf32':
<artificial>:(.text+0x25c6): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2dcd): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2f4c): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x309c): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkimage.alCOld.ltrans0.ltrans.o: in function `add_fixup_entry.lto_priv.0':
<artificial>:(.text+0x3501): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3554): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3592): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3691): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x370d): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkimage.alCOld.ltrans0.ltrans.o: in function `create_u64_fixups.lto_priv.0':
<artificial>:(.text+0x3871): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x38a6): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x38dd): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x394e): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkimage.alCOld.ltrans0.ltrans.o: in function `grub_mkimage_generate_elf64':
<artificial>:(.text+0x3a50): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4318): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4447): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4570): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkimage.alCOld.ltrans0.ltrans.o: in function `add_fixup_entry.lto_priv.1':
<artificial>:(.text+0x4ac1): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4b18): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4b59): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4c69): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4cde): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkimage.alCOld.ltrans0.ltrans.o: in function `create_u64_fixups.lto_priv.1':
<artificial>:(.text+0x4e49): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4e81): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4ebc): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4f2b): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkimage.alCOld.ltrans0.ltrans.o: in function `relocate_addrs64':
<artificial>:(.text+0x506e): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5138): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5290): undefined reference to `grub_ia64_add_value_to_slot_21'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x52f1): undefined reference to `grub_ia64_make_trampoline'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5338): undefined reference to `grub_ia64_add_value_to_slot_20b'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x539d): undefined reference to `grub_ia64_set_immu64'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x53b5): undefined reference to `grub_ia64_add_value_to_slot_21'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x53ed): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x54e7): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x552f): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x555b): undefined reference to `grub_arm_64_check_xxxx26_offset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5574): undefined reference to `grub_arm64_set_xxxx26_offset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x55e2): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x560f): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x564a): undefined reference to `grub_arm64_check_hi21_signed'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5660): undefined reference to `grub_arm64_set_hi21'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x56da): undefined reference to `grub_arm64_check_hi21_signed'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x56f3): undefined reference to `grub_arm64_set_hi21'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5785): undefined reference to `grub_arm64_set_abs_lo12_ldst64'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x57a7): undefined reference to `grub_arm64_set_abs_lo12_ldst64'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5808): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x581d): undefined reference to `grub_arm64_set_abs_lo12'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5e55): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5f1f): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5fb9): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x60f7): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6446): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x65f3): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x66f4): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6701): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x670c): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkimage.alCOld.ltrans0.ltrans.o:<artificial>:(.text+0x6719): more undefined references to `grub_util_error' follow
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkimage.alCOld.ltrans0.ltrans.o: in function `grub_mkimage_load_image32':
<artificial>:(.text+0x678b): undefined reference to `grub_memset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x679c): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x67a8): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x67bc): undefined reference to `grub_util_load_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x67d8): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x68d2): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x68f9): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6e11): undefined reference to `grub_xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6e21): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x70e2): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x71f2): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x74d8): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7581): undefined reference to `grub_strcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x75ae): undefined reference to `grub_strcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x75db): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x772c): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x788f): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x792c): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7a65): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7fa8): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7fbc): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8024): undefined reference to `grub_arm_thm_call_get_offset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8045): undefined reference to `grub_real_dprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8076): undefined reference to `grub_real_dprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x80ac): undefined reference to `grub_real_dprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x80b7): undefined reference to `grub_arm_thm_call_set_offset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x80c4): undefined reference to `grub_errmsg'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x80d1): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x80e4): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x818f): undefined reference to `grub_arm_jump24_get_offset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x819b): undefined reference to `grub_arm_jump24_check_offset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x81b1): undefined reference to `grub_arm_jump24_set_offset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x81c9): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8213): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8278): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x82ab): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x831e): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x834e): undefined reference to `grub_arm_thm_jump19_get_offset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x835a): undefined reference to `grub_arm_thm_jump19_check_offset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8370): undefined reference to `grub_arm_thm_jump19_set_offset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x83a4): undefined reference to `grub_arm_jump24_check_offset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8413): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x842a): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8597): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x85dc): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x899f): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8b8f): undefined reference to `grub_memset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8c13): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8c22): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8d1a): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8d49): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8d8d): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8e1e): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8e3a): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8e52): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8eab): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8f78): undefined reference to `xrealloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x92e7): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x959b): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9687): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x97af): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9886): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x98c7): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x98d2): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x98e2): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x98f2): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkimage.alCOld.ltrans0.ltrans.o:<artificial>:(.text+0x9905): more undefined references to `grub_util_error' follow
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkimage.alCOld.ltrans0.ltrans.o: in function `grub_install_generate_image':
<artificial>:(.text+0x99af): undefined reference to `grub_util_get_path'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x99c0): undefined reference to `grub_util_fopen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9a36): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9a44): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9a85): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9ab5): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9ac8): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9ad4): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9bfa): undefined reference to `grub_util_get_path'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9c5a): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9c80): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9c92): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9cbf): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9cd1): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9cfb): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9d1c): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9d3d): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9d56): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9d81): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9d8c): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9db1): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9dd3): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9dfc): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9e2c): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9e50): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9e7a): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9eb8): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9ee2): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9f37): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9f64): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9f9a): undefined reference to `grub_memset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9fb4): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9fc0): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9fd4): undefined reference to `grub_util_load_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa0ea): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa10e): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa208): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa28a): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa413): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa450): undefined reference to `grub_util_load_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa48c): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa4d0): undefined reference to `grub_util_load_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa53c): undefined reference to `grub_util_load_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa593): undefined reference to `grub_util_load_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa5e9): undefined reference to `grub_util_load_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa639): undefined reference to `grub_strcpy'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa651): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa695): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa6d2): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa705): undefined reference to `grub_util_get_path'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa711): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa71d): undefined reference to `grub_util_read_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa7d5): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa923): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa934): undefined reference to `grub_memset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa9b5): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xaa41): undefined reference to `grub_util_write_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xab0a): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xab1c): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xab5b): undefined reference to `_gcry_digest_spec_crc32'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xab87): undefined reference to `grub_crypto_hash'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xab98): undefined reference to `_gcry_digest_spec_crc32'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xab9e): undefined reference to `grub_crypto_hash'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xabda): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xac92): undefined reference to `grub_util_get_path'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xac9e): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xacaa): undefined reference to `grub_util_read_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xacb7): undefined reference to `_gcry_digest_spec_sha512'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xacc6): undefined reference to `grub_crypto_hash'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xaccd): undefined reference to `_gcry_digest_spec_sha512'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xacde): undefined reference to `grub_memcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xad09): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xadb7): undefined reference to `grub_util_get_path'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xadca): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xaddf): undefined reference to `grub_util_read_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xae09): undefined reference to `grub_util_write_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xae35): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xae48): undefined reference to `grub_memset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xaeb0): undefined reference to `grub_util_get_path'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xaebc): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xaecd): undefined reference to `grub_util_read_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xaeef): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xb005): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xb379): undefined reference to `grub_util_get_path'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xb385): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xb39a): undefined reference to `grub_util_read_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xb3e1): undefined reference to `grub_util_write_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xb4e9): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xb99a): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xba47): undefined reference to `grub_strcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xba7a): undefined reference to `grub_strcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xbaaf): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xbabf): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xbb16): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xbb79): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xbbd4): undefined reference to `grub_memset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xbc6c): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xbc7b): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xbd74): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xbda5): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xbe03): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xbe9e): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xbf5a): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xbf67): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc003): undefined reference to `xrealloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc086): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc0ea): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc1cc): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc2cd): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc320): undefined reference to `grub_arm64_dl_get_tramp_got_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc383): undefined reference to `grub_ia64_dl_get_tramp_got_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc770): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc7a2): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc83e): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc8b7): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc8ec): undefined reference to `LzmaEncProps_Init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc924): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc974): undefined reference to `LzmaEncode'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc992): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc9a4): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc9c5): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc9e4): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xca8f): undefined reference to `grub_util_warn'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xcaa7): undefined reference to `grub_util_get_path'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xcac1): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xcaf7): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xcb32): undefined reference to `grub_util_get_path'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xcb3e): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xcb4a): undefined reference to `grub_util_read_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xcb63): undefined reference to `grub_util_write_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xcb8a): undefined reference to `grub_util_get_path'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xcb96): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xcba2): undefined reference to `grub_util_read_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xcbbb): undefined reference to `grub_util_write_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xcc6a): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkimage.alCOld.ltrans0.ltrans.o: in function `argp_parser':
<artificial>:(.text+0xccb6): undefined reference to `verbosity'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xccc9): undefined reference to `grub_strcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xccf2): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xcde9): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xce07): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xce38): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xce5b): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkimage.alCOld.ltrans0.ltrans.o:<artificial>:(.text+0xce7e): more undefined references to `xstrdup' follow
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkimage.alCOld.ltrans0.ltrans.o: in function `argp_parser':
<artificial>:(.text+0xcec2): undefined reference to `xrealloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xcedf): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xcf11): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xcf2a): undefined reference to `grub_strcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xcf48): undefined reference to `grub_strcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xcf85): undefined reference to `argp_state_help'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xcfba): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkimage.alCOld.ltrans0.ltrans.o: in function `help_filter':
<artificial>:(.text+0xcff1): undefined reference to `xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd0ad): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd27a): undefined reference to `xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkimage.alCOld.ltrans0.ltrans.o: in function `main':
<artificial>:(.text.startup+0x21): undefined reference to `set_program_name'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x71): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xa7): undefined reference to `argp_parse'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xdc): undefined reference to `grub_util_fopen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x14d): undefined reference to `grub_util_file_sync'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1e5): undefined reference to `grub_strlen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1f1): undefined reference to `grub_strlen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1fc): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x288): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x2ab): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x2b9): undefined reference to `program_name'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x2bf): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x2e7): undefined reference to `argp_help'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x302): undefined reference to `program_name'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x308): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x361): undefined reference to `grub_util_error'
collect2: error: ld returned 1 exit status
make[2]: *** [Makefile:4563: grub-mkimage] Error 1
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkstandalone.MENaDE.ltrans0.ltrans.o: in function `SzAlloc':
<artificial>:(.text+0xd5): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkstandalone.MENaDE.ltrans0.ltrans.o: in function `finish_reloc_translation_raw.isra.0.lto_priv.0':
<artificial>:(.text+0x130): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1cf): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkstandalone.MENaDE.ltrans0.ltrans.o: in function `handle_install_list.constprop.0':
<artificial>:(.text+0x242): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x272): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x29f): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2ba): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2f7): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x30f): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkstandalone.MENaDE.ltrans0.ltrans.o: in function `add_fixup_entry.lto_priv.0':
<artificial>:(.text+0x3b1): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x404): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x442): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x541): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5bd): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkstandalone.MENaDE.ltrans0.ltrans.o: in function `add_fixup_entry.lto_priv.1':
<artificial>:(.text+0x641): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x698): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6d9): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7e9): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x85e): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkstandalone.MENaDE.ltrans0.ltrans.o: in function `put_section32.isra.0':
<artificial>:(.text+0xc8d): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkstandalone.MENaDE.ltrans0.ltrans.o: in function `put_section64.isra.0':
<artificial>:(.text+0x11e1): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkstandalone.MENaDE.ltrans0.ltrans.o: in function `create_u64_fixups.lto_priv.1':
<artificial>:(.text+0x1459): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1491): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x14cc): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x153b): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkstandalone.MENaDE.ltrans0.ltrans.o: in function `create_u64_fixups.lto_priv.0':
<artificial>:(.text+0x16a1): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x16d6): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x170d): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x177e): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkstandalone.MENaDE.ltrans0.ltrans.o: in function `add_module':
<artificial>:(.text+0x17fe): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x18a1): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x18b9): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x18ff): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1998): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x19c9): undefined reference to `grub_util_get_path'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x19ed): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkstandalone.MENaDE.ltrans0.ltrans.o: in function `grub_util_resolve_dependencies.constprop.0':
<artificial>:(.text+0x1a40): undefined reference to `grub_util_get_path'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1a51): undefined reference to `grub_util_fopen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1ab9): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1ac7): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1b02): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1b2a): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1b44): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1b50): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1c77): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1c89): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkstandalone.MENaDE.ltrans0.ltrans.o: in function `grub_host_open':
<artificial>:(.text+0x1c9b): undefined reference to `grub_strcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1ccf): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkstandalone.MENaDE.ltrans0.ltrans.o: in function `grub_hostfs_close':
<artificial>:(.text+0x1cea): undefined reference to `grub_util_fd_close'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1cf4): undefined reference to `grub_free'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1cfd): undefined reference to `grub_free'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkstandalone.MENaDE.ltrans0.ltrans.o: in function `grub_hostfs_read':
<artificial>:(.text+0x1d2e): undefined reference to `grub_util_fd_seek'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1d42): undefined reference to `grub_util_fd_read'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1d52): undefined reference to `grub_util_fd_strerror'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1d6b): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1d82): undefined reference to `grub_util_fd_strerror'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1d9b): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkstandalone.MENaDE.ltrans0.ltrans.o: in function `grub_hostfs_open':
<artificial>:(.text+0x1dc7): undefined reference to `grub_util_fd_open'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1dd9): undefined reference to `grub_malloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1dea): undefined reference to `grub_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1e09): undefined reference to `grub_util_get_fd_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1e4c): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1e55): undefined reference to `grub_free'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1e5e): undefined reference to `grub_util_fd_close'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1e64): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkstandalone.MENaDE.ltrans0.ltrans.o: in function `grub_hostfs_dir':
<artificial>:(.text+0x1ea6): undefined reference to `grub_strcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1ef2): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1f38): undefined reference to `grub_util_is_directory'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1f7f): undefined reference to `grub_memset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1fbe): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1fda): undefined reference to `grub_util_fd_strerror'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1ff2): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkstandalone.MENaDE.ltrans0.ltrans.o: in function `grub_install_compress_gzip':
<artificial>:(.text+0x2036): undefined reference to `grub_util_exec_redirect'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkstandalone.MENaDE.ltrans0.ltrans.o: in function `grub_install_compress_xz':
<artificial>:(.text+0x2083): undefined reference to `grub_util_exec_redirect'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkstandalone.MENaDE.ltrans0.ltrans.o: in function `grub_install_compress_lzop':
<artificial>:(.text+0x20c6): undefined reference to `grub_util_exec_redirect'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkstandalone.MENaDE.ltrans0.ltrans.o: in function `clean_grub_dir':
<artificial>:(.text+0x21c5): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2278): undefined reference to `grub_util_fd_strerror'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x228b): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2291): undefined reference to `grub_util_fd_strerror'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x22a4): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkstandalone.MENaDE.ltrans0.ltrans.o: in function `grub_util_unlink_recursive':
<artificial>:(.text+0x22ee): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x22fa): undefined reference to `grub_util_is_special_file'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2307): undefined reference to `grub_util_is_regular'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2314): undefined reference to `grub_util_is_directory'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkstandalone.MENaDE.ltrans0.ltrans.o: in function `grub_install_get_target':
<artificial>:(.text+0x23a2): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x23b0): undefined reference to `grub_util_fd_open'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x23ce): undefined reference to `grub_util_fd_read'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x23e3): undefined reference to `grub_util_fd_close'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2410): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2441): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2477): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x24a8): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2614): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2641): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2662): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2672): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkstandalone.MENaDE.ltrans0.ltrans.o: in function `grub_install_push_module':
<artificial>:(.text+0x26ce): undefined reference to `xrealloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x26f4): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkstandalone.MENaDE.ltrans0.ltrans.o: in function `grub_install_mkdir_p':
<artificial>:(.text+0x2738): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkstandalone.MENaDE.ltrans0.ltrans.o: in function `grub_install_copy_file':
<artificial>:(.text+0x27d3): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x27de): undefined reference to `grub_util_fd_open'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x27f1): undefined reference to `grub_util_fd_strerror'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2804): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x282c): undefined reference to `grub_util_fd_open'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x285c): undefined reference to `grub_util_fd_write'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2878): undefined reference to `grub_util_fd_read'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x288e): undefined reference to `grub_util_fd_sync'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x289a): undefined reference to `grub_util_fd_close'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x28b1): undefined reference to `grub_util_fd_close'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x28da): undefined reference to `grub_util_fd_close'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x28e3): undefined reference to `grub_util_fd_close'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x28e9): undefined reference to `grub_util_fd_strerror'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x28ff): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x290f): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2924): undefined reference to `grub_util_fd_strerror'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2937): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x293d): undefined reference to `grub_util_fd_strerror'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2950): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkstandalone.MENaDE.ltrans0.ltrans.o: in function `grub_install_compress_file.constprop.0':
<artificial>:(.text+0x2984): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x29bf): undefined reference to `grub_util_warn'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x29ca): undefined reference to `grub_util_fd_strerror'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x29e0): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkstandalone.MENaDE.ltrans0.ltrans.o: in function `grub_install_compress_file':
<artificial>:(.text+0x2a2e): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2a8f): undefined reference to `grub_util_warn'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2a97): undefined reference to `grub_util_fd_strerror'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2aad): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkstandalone.MENaDE.ltrans0.ltrans.o: in function `grub_mkimage_load_image64':
<artificial>:(.text+0x34f8): undefined reference to `grub_memset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3509): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3515): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3529): undefined reference to `grub_util_load_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3558): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3648): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3679): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3b92): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3cc1): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x40b3): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4107): undefined reference to `grub_arm64_dl_get_tramp_got_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x42af): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4386): undefined reference to `grub_strcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x43b8): undefined reference to `grub_strcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4411): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4589): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4645): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x47b9): undefined reference to `grub_ia64_add_value_to_slot_21'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4810): undefined reference to `grub_ia64_make_trampoline'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4857): undefined reference to `grub_ia64_add_value_to_slot_20b'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x48b8): undefined reference to `grub_ia64_add_value_to_slot_21'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x48d1): undefined reference to `grub_ia64_set_immu64'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4909): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4934): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4a26): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4a6e): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4a9b): undefined reference to `grub_arm_64_check_xxxx26_offset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4ab4): undefined reference to `grub_arm64_set_xxxx26_offset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4b23): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4b50): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4bee): undefined reference to `grub_arm64_check_hi21_signed'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4c07): undefined reference to `grub_arm64_set_hi21'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4c9d): undefined reference to `grub_arm64_set_abs_lo12_ldst64'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4ce4): undefined reference to `grub_arm64_check_hi21_signed'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4cfa): undefined reference to `grub_arm64_set_hi21'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4d0f): undefined reference to `grub_arm64_set_abs_lo12'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4d24): undefined reference to `grub_arm64_set_abs_lo12_ldst64'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4d67): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x543d): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x54e9): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5632): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5993): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5abc): undefined reference to `grub_memset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5b5c): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5b74): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5c64): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5c95): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5cf6): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5d8a): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5e1e): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5ed0): undefined reference to `xrealloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x60b6): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x60e7): undefined reference to `grub_ia64_dl_get_tramp_got_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x623d): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x632a): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x64c9): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6565): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x65a5): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x65b5): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x65c7): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x65d2): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x65fb): undefined reference to `grub_xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x660b): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6624): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6631): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x663e): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x664b): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkstandalone.MENaDE.ltrans0.ltrans.o:<artificial>:(.text+0x665b): more undefined references to `grub_util_error' follow
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkstandalone.MENaDE.ltrans0.ltrans.o: in function `grub_mkimage_load_image32':
<artificial>:(.text+0x66b8): undefined reference to `grub_memset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x66c9): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x66d5): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x66e9): undefined reference to `grub_util_load_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6705): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6810): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6841): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6c74): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6ef8): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x71ec): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7296): undefined reference to `grub_strcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x72cb): undefined reference to `grub_strcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7301): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7451): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x75c3): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x761f): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x775d): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7c78): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7ca8): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7cbc): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7d28): undefined reference to `grub_arm_thm_call_get_offset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7d49): undefined reference to `grub_real_dprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7d7a): undefined reference to `grub_real_dprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7db0): undefined reference to `grub_real_dprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7dbb): undefined reference to `grub_arm_thm_call_set_offset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7dc8): undefined reference to `grub_errmsg'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7dd5): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7dec): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7e98): undefined reference to `grub_arm_jump24_get_offset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7ea4): undefined reference to `grub_arm_jump24_check_offset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7eba): undefined reference to `grub_arm_jump24_set_offset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7ed2): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7fe3): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8003): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x80a6): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x80ec): undefined reference to `grub_arm_thm_jump19_get_offset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x80f8): undefined reference to `grub_arm_thm_jump19_check_offset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x810e): undefined reference to `grub_arm_thm_jump19_set_offset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8140): undefined reference to `grub_arm_jump24_check_offset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x81af): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x81c6): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x833d): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8382): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8733): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x88e6): undefined reference to `grub_memset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8986): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x899e): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8a80): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8aaf): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8af3): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8b83): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8b9f): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8bb7): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8bf7): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8cf1): undefined reference to `xrealloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8f57): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x928a): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x937a): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x94ae): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9508): undefined reference to `grub_xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9518): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9531): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x954e): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9561): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9571): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkstandalone.MENaDE.ltrans0.ltrans.o:<artificial>:(.text+0x95a7): more undefined references to `grub_util_error' follow
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkstandalone.MENaDE.ltrans0.ltrans.o: in function `grub_install_generate_image.constprop.0':
<artificial>:(.text+0x9656): undefined reference to `grub_util_get_path'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x96ac): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x96d2): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x96e0): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9707): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x971f): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9746): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x976d): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9793): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x97a7): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x97d3): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x97e7): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9810): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9828): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9851): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x987e): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x98a6): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x98c3): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x990d): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x993a): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9ad6): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9b17): undefined reference to `grub_util_load_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9b55): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9b9e): undefined reference to `grub_util_load_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9c12): undefined reference to `grub_util_load_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9c67): undefined reference to `grub_util_load_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9cb3): undefined reference to `grub_strcpy'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9ccb): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9d10): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9d48): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9d79): undefined reference to `grub_util_get_path'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9d85): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9d91): undefined reference to `grub_util_read_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9e4b): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9eee): undefined reference to `grub_util_load_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa07c): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa608): undefined reference to `grub_util_write_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa691): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa6c3): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa6fa): undefined reference to `_gcry_digest_spec_crc32'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa724): undefined reference to `grub_crypto_hash'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa735): undefined reference to `_gcry_digest_spec_crc32'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa73b): undefined reference to `grub_crypto_hash'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa772): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa819): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa82a): undefined reference to `grub_memset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa8a7): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa939): undefined reference to `grub_util_get_path'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa945): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa951): undefined reference to `grub_util_read_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa95e): undefined reference to `_gcry_digest_spec_sha512'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa96d): undefined reference to `grub_crypto_hash'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa974): undefined reference to `_gcry_digest_spec_sha512'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa985): undefined reference to `grub_memcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa9b0): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xaa42): undefined reference to `grub_util_get_path'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xaa4e): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xaa5e): undefined reference to `grub_util_read_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xaa7d): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xab2d): undefined reference to `grub_util_get_path'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xab40): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xab55): undefined reference to `grub_util_read_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xab81): undefined reference to `grub_util_write_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xabad): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xabc0): undefined reference to `grub_memset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xac62): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xb004): undefined reference to `grub_util_get_path'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xb010): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xb025): undefined reference to `grub_util_read_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xb06a): undefined reference to `grub_util_write_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xb0f3): undefined reference to `LzmaEncProps_Init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xb12a): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xb175): undefined reference to `LzmaEncode'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xb19f): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xb255): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xb3dd): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xba12): undefined reference to `grub_util_get_path'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xba35): undefined reference to `grub_util_warn'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xbd25): undefined reference to `grub_util_get_path'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xbd31): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xbd3d): undefined reference to `grub_util_read_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xbd56): undefined reference to `grub_util_write_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xbd7d): undefined reference to `grub_util_get_path'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xbd89): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xbd95): undefined reference to `grub_util_read_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xbdae): undefined reference to `grub_util_write_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc0c0): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc1d2): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc73c): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xcaf1): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xcd59): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xcd6b): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xcd7f): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xcdc5): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xcddd): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkstandalone.MENaDE.ltrans0.ltrans.o:<artificial>:(.text+0xcdef): more undefined references to `grub_util_error' follow
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkstandalone.MENaDE.ltrans0.ltrans.o: in function `help_filter':
<artificial>:(.text+0xcef5): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd0ba): undefined reference to `xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd0ee): undefined reference to `xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd136): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkstandalone.MENaDE.ltrans0.ltrans.o: in function `add_tar_file':
<artificial>:(.text+0xd199): undefined reference to `grub_util_is_special_file'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd1bd): undefined reference to `grub_util_get_mtime'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd1d2): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd248): undefined reference to `grub_util_is_directory'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd268): undefined reference to `grub_util_fd_open'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd292): undefined reference to `grub_util_get_fd_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd3e3): undefined reference to `grub_util_is_directory'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd42b): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd441): undefined reference to `xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd48a): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd49c): undefined reference to `grub_util_fd_strerror'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd4af): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkstandalone.MENaDE.ltrans0.ltrans.o: in function `argp_parser':
<artificial>:(.text+0xd520): undefined reference to `verbosity'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd540): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd574): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd5bd): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd601): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd625): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkstandalone.MENaDE.ltrans0.ltrans.o:<artificial>:(.text+0xd64e): more undefined references to `xstrdup' follow
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkstandalone.MENaDE.ltrans0.ltrans.o: in function `argp_parser':
<artificial>:(.text+0xd718): undefined reference to `xrealloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd73e): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd8ca): undefined reference to `argp_state_help'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd8e5): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkstandalone.MENaDE.ltrans0.ltrans.o: in function `grub_mod_fini.lto_priv.1':
<artificial>:(.text+0xda27): undefined reference to `grub_disk_dev_unregister'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkstandalone.MENaDE.ltrans0.ltrans.o: in function `grub_mod_init.lto_priv.1':
<artificial>:(.text+0xda37): undefined reference to `grub_disk_dev_register'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkstandalone.MENaDE.ltrans0.ltrans.o: in function `grub_mod_fini.lto_priv.0':
<artificial>:(.text+0xda47): undefined reference to `grub_list_remove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkstandalone.MENaDE.ltrans0.ltrans.o: in function `grub_mod_init.lto_priv.0':
<artificial>:(.text+0xda56): undefined reference to `grub_fs_list'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xda5c): undefined reference to `grub_list_push'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkstandalone.MENaDE.ltrans0.ltrans.o: in function `add_tar_file.cold':
<artificial>:(.text.unlikely+0x312): undefined reference to `grub_util_fd_read'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.unlikely+0x33e): undefined reference to `grub_util_fd_close'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkstandalone.MENaDE.ltrans0.ltrans.o: in function `main':
<artificial>:(.text.startup+0x1b): undefined reference to `set_program_name'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x4a): undefined reference to `grub_util_disable_fd_syncs'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x5a): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x79): undefined reference to `argp_parse'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xb4): undefined reference to `grub_util_make_temporary_dir'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xd3): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x122): undefined reference to `xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x138): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x159): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1ee): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x204): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x25c): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x291): undefined reference to `grub_strrchr'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x36e): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x384): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x3d8): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x415): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x421): undefined reference to `grub_util_is_regular'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x49c): undefined reference to `grub_util_path_concat_ext'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x4c3): undefined reference to `grub_util_path_concat_ext'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x50b): undefined reference to `grub_util_make_temporary_file'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x51c): undefined reference to `grub_util_fopen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x552): undefined reference to `grub_strchr'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x5f7): undefined reference to `grub_util_fopen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x64d): undefined reference to `grub_strlen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x679): undefined reference to `grub_strlen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x6b2): undefined reference to `grub_strlen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x6cd): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x84e): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x9b8): undefined reference to `grub_util_file_sync'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xa08): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xa2d): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xa3b): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xad8): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xae4): undefined reference to `grub_util_is_special_file'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xaf1): undefined reference to `grub_util_is_directory'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xb08): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xc05): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xc1a): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xc51): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xc66): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xca2): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xcc7): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xd5a): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xd6a): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xd8b): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xd9d): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xda3): undefined reference to `grub_util_fd_strerror'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xdb6): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xdc6): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xdcc): undefined reference to `grub_util_fd_strerror'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xddf): undefined reference to `grub_util_error'
collect2: error: ld returned 1 exit status
make[2]: *** [Makefile:4784: grub-mkstandalone] Error 1
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mknetdir.fEFGCb.ltrans0.ltrans.o: in function `SzAlloc':
<artificial>:(.text+0x15): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mknetdir.fEFGCb.ltrans0.ltrans.o: in function `finish_reloc_translation_raw.isra.0.lto_priv.0':
<artificial>:(.text+0x70): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x10f): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mknetdir.fEFGCb.ltrans0.ltrans.o: in function `add_fixup_entry.lto_priv.0':
<artificial>:(.text+0x1a1): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1f4): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x232): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x331): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3ad): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mknetdir.fEFGCb.ltrans0.ltrans.o: in function `add_fixup_entry.lto_priv.1':
<artificial>:(.text+0x431): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x488): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4c9): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5d9): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x64e): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mknetdir.fEFGCb.ltrans0.ltrans.o: in function `put_section32.isra.0':
<artificial>:(.text+0xa7d): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mknetdir.fEFGCb.ltrans0.ltrans.o: in function `put_section64.isra.0':
<artificial>:(.text+0xfd1): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mknetdir.fEFGCb.ltrans0.ltrans.o: in function `handle_install_list.constprop.0':
<artificial>:(.text+0x1142): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1172): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x119f): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x11ba): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x11f7): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x120f): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mknetdir.fEFGCb.ltrans0.ltrans.o: in function `add_module':
<artificial>:(.text+0x12ae): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1351): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1369): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x13af): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1448): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1479): undefined reference to `grub_util_get_path'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x149d): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mknetdir.fEFGCb.ltrans0.ltrans.o: in function `grub_util_resolve_dependencies.constprop.0':
<artificial>:(.text+0x14f0): undefined reference to `grub_util_get_path'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1501): undefined reference to `grub_util_fopen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1569): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1577): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x15b2): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x15da): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x15f4): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1600): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1760): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1776): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mknetdir.fEFGCb.ltrans0.ltrans.o: in function `grub_install_compress_gzip':
<artificial>:(.text+0x17b6): undefined reference to `grub_util_exec_redirect'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mknetdir.fEFGCb.ltrans0.ltrans.o: in function `grub_install_compress_xz':
<artificial>:(.text+0x1803): undefined reference to `grub_util_exec_redirect'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mknetdir.fEFGCb.ltrans0.ltrans.o: in function `grub_install_compress_lzop':
<artificial>:(.text+0x1846): undefined reference to `grub_util_exec_redirect'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mknetdir.fEFGCb.ltrans0.ltrans.o: in function `grub_install_get_target':
<artificial>:(.text+0x1872): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1880): undefined reference to `grub_util_fd_open'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x189e): undefined reference to `grub_util_fd_read'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x18b3): undefined reference to `grub_util_fd_close'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x18e0): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1911): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1947): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1978): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1ae4): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1b11): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1b32): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1b42): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mknetdir.fEFGCb.ltrans0.ltrans.o: in function `grub_install_push_module':
<artificial>:(.text+0x1b9d): undefined reference to `xrealloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1bc6): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1bfd): undefined reference to `xrealloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mknetdir.fEFGCb.ltrans0.ltrans.o: in function `clean_grub_dir':
<artificial>:(.text+0x1d15): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1dc8): undefined reference to `grub_util_fd_strerror'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1ddb): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1de1): undefined reference to `grub_util_fd_strerror'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1df4): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mknetdir.fEFGCb.ltrans0.ltrans.o: in function `grub_install_copy_file':
<artificial>:(.text+0x1e23): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1e2e): undefined reference to `grub_util_fd_open'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1e41): undefined reference to `grub_util_fd_strerror'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1e54): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1e7c): undefined reference to `grub_util_fd_open'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1eac): undefined reference to `grub_util_fd_write'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1ec8): undefined reference to `grub_util_fd_read'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1ede): undefined reference to `grub_util_fd_sync'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1eea): undefined reference to `grub_util_fd_close'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1f01): undefined reference to `grub_util_fd_close'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1f2a): undefined reference to `grub_util_fd_close'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1f33): undefined reference to `grub_util_fd_close'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1f39): undefined reference to `grub_util_fd_strerror'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1f4f): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1f5f): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1f74): undefined reference to `grub_util_fd_strerror'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1f87): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1f8d): undefined reference to `grub_util_fd_strerror'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1fa0): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mknetdir.fEFGCb.ltrans0.ltrans.o: in function `grub_install_compress_file.constprop.0':
<artificial>:(.text+0x1fd4): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x200f): undefined reference to `grub_util_warn'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x201a): undefined reference to `grub_util_fd_strerror'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2030): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mknetdir.fEFGCb.ltrans0.ltrans.o: in function `grub_install_compress_file':
<artificial>:(.text+0x207e): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x20df): undefined reference to `grub_util_warn'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x20e7): undefined reference to `grub_util_fd_strerror'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x20fd): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mknetdir.fEFGCb.ltrans0.ltrans.o: in function `grub_install_help_filter':
<artificial>:(.text+0x2157): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2167): undefined reference to `xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x217b): undefined reference to `xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x218b): undefined reference to `xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x219b): undefined reference to `xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mknetdir.fEFGCb.ltrans0.ltrans.o: in function `argp_parser':
<artificial>:(.text+0x2bfe): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2c36): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2c62): undefined reference to `verbosity'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2c7f): undefined reference to `grub_strcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2cb7): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2d9b): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2dbf): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2de8): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2e12): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2e48): undefined reference to `xrealloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2e6e): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2eba): undefined reference to `grub_strcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2f39): undefined reference to `grub_strcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2f5c): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2f6c): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mknetdir.fEFGCb.ltrans0.ltrans.o: in function `grub_mkimage_load_image64':
<artificial>:(.text+0x2fcb): undefined reference to `grub_memset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2fdc): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2fe8): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2ff7): undefined reference to `grub_util_load_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3026): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x314c): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3173): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x360f): undefined reference to `grub_xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x361f): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3f34): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x40ac): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x42a4): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4677): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4739): undefined reference to `grub_strcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x476c): undefined reference to `grub_strcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x47a2): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4989): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x49ed): undefined reference to `grub_arm64_dl_get_tramp_got_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4b6a): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4c47): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4d9f): undefined reference to `grub_ia64_add_value_to_slot_21'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4e06): undefined reference to `grub_ia64_make_trampoline'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4e50): undefined reference to `grub_ia64_add_value_to_slot_20b'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4ebc): undefined reference to `grub_ia64_add_value_to_slot_21'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4ed9): undefined reference to `grub_ia64_set_immu64'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4f14): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4f3d): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5049): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5098): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x50ef): undefined reference to `grub_arm_64_check_xxxx26_offset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5105): undefined reference to `grub_arm64_set_xxxx26_offset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5156): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x518e): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x51c9): undefined reference to `grub_arm64_set_abs_lo12'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x522f): undefined reference to `grub_arm64_check_hi21_signed'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5247): undefined reference to `grub_arm64_set_hi21'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x54ce): undefined reference to `grub_arm64_set_abs_lo12_ldst64'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x54f4): undefined reference to `grub_arm64_set_abs_lo12_ldst64'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x554f): undefined reference to `grub_arm64_check_hi21_signed'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5565): undefined reference to `grub_arm64_set_hi21'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x55a4): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5c83): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5cea): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5f3a): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6395): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6578): undefined reference to `grub_memset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6616): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6625): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6727): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x675b): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6814): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6895): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6920): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x69d7): undefined reference to `xrealloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x71bf): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7331): undefined reference to `grub_ia64_dl_get_tramp_got_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7628): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7700): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7807): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7a8f): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7bba): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7cab): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7cb8): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7cda): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7ce5): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mknetdir.fEFGCb.ltrans0.ltrans.o:<artificial>:(.text+0x7cf2): more undefined references to `grub_util_error' follow
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mknetdir.fEFGCb.ltrans0.ltrans.o: in function `grub_mkimage_load_image32':
<artificial>:(.text+0x7dcb): undefined reference to `grub_memset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7ddc): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7de8): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7dfc): undefined reference to `grub_util_load_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7e18): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7f1e): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7f45): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8431): undefined reference to `grub_xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8441): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8c27): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8d30): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8ef8): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x92ec): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x93a8): undefined reference to `grub_strcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x93dc): undefined reference to `grub_strcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9412): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x955d): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x96a5): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x978b): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x981b): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x99e5): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9ebf): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9f14): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9f2c): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9f8f): undefined reference to `grub_arm_thm_call_get_offset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9fb0): undefined reference to `grub_real_dprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9fe1): undefined reference to `grub_real_dprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa017): undefined reference to `grub_real_dprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa022): undefined reference to `grub_arm_thm_call_set_offset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa02f): undefined reference to `grub_errmsg'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa03c): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa04c): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa0fe): undefined reference to `grub_arm_jump24_get_offset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa10a): undefined reference to `grub_arm_jump24_check_offset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa120): undefined reference to `grub_arm_jump24_set_offset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa138): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa185): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa270): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa29e): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa2dd): undefined reference to `grub_arm_thm_jump19_get_offset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa2e9): undefined reference to `grub_arm_thm_jump19_check_offset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa2ff): undefined reference to `grub_arm_thm_jump19_set_offset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa341): undefined reference to `grub_arm_jump24_check_offset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa3b4): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa3ce): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa550): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa594): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa966): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xad34): undefined reference to `grub_memset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xadd1): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xade0): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xaed4): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xaf0c): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xafbe): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xb045): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xb061): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xb079): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xb0b4): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xb407): undefined reference to `xrealloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xb69b): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xbb8f): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xbc9f): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xbf1b): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc053): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc17d): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc190): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc1a0): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc1ce): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc23a): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mknetdir.fEFGCb.ltrans0.ltrans.o:<artificial>:(.text+0xc256): more undefined references to `grub_util_error' follow
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mknetdir.fEFGCb.ltrans0.ltrans.o: in function `grub_install_generate_image.constprop.0':
<artificial>:(.text+0xc305): undefined reference to `grub_util_get_path'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc35d): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc389): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc398): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc3c0): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc3d9): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc401): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc431): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc453): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc46c): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc497): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc4a2): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc4c7): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc4e9): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc50d): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc54d): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc588): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc5b0): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc5f6): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc623): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc795): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc7da): undefined reference to `grub_util_load_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc835): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc880): undefined reference to `grub_util_load_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc8f5): undefined reference to `grub_util_load_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc953): undefined reference to `grub_util_load_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc9a2): undefined reference to `grub_strcpy'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc9ba): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc9fe): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xca36): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xca69): undefined reference to `grub_util_get_path'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xca75): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xca83): undefined reference to `grub_util_read_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xcb41): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xcbe4): undefined reference to `grub_util_load_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xccdf): undefined reference to `grub_util_get_path'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xcceb): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xcd00): undefined reference to `grub_util_read_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xcd48): undefined reference to `grub_util_write_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xcd82): undefined reference to `grub_util_write_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xce07): undefined reference to `grub_util_get_path'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xce17): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xce2c): undefined reference to `grub_util_read_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xce58): undefined reference to `grub_util_write_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xce91): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xcea4): undefined reference to `grub_memset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd096): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd6b7): undefined reference to `grub_util_get_path'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd6c3): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd6d1): undefined reference to `grub_util_read_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd6ec): undefined reference to `grub_util_write_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd85e): undefined reference to `grub_util_get_path'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd86a): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd87b): undefined reference to `grub_util_read_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd89d): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd9e7): undefined reference to `grub_util_get_path'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd9f3): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd9ff): undefined reference to `grub_util_read_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xda0c): undefined reference to `_gcry_digest_spec_sha512'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xda1b): undefined reference to `grub_crypto_hash'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xda22): undefined reference to `_gcry_digest_spec_sha512'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xda33): undefined reference to `grub_memcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xda5e): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xdb1c): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xdbba): undefined reference to `LzmaEncProps_Init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xdbe8): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xdc35): undefined reference to `LzmaEncode'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xdc5f): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xdd1d): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xddc7): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xe199): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xe1c6): undefined reference to `_gcry_digest_spec_crc32'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xe20d): undefined reference to `grub_crypto_hash'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xe21e): undefined reference to `_gcry_digest_spec_crc32'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xe224): undefined reference to `grub_crypto_hash'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xe29b): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xe2ac): undefined reference to `grub_memset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xe32f): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xe443): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xea09): undefined reference to `grub_util_get_path'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xea15): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xea23): undefined reference to `grub_util_read_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xea3e): undefined reference to `grub_util_write_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xebe9): undefined reference to `grub_util_get_path'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xed8f): undefined reference to `grub_util_warn'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xf3fc): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xf519): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xfb43): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xfc74): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1010c): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x10120): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x10132): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x10144): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x10170): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mknetdir.fEFGCb.ltrans0.ltrans.o:<artificial>:(.text+0x1018a): more undefined references to `grub_util_error' follow
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mknetdir.fEFGCb.ltrans0.ltrans.o: in function `process_input_dir':
<artificial>:(.text+0x101ee): undefined reference to `xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x10211): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1022b): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1026b): undefined reference to `xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x10281): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x102a2): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x102b0): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1037e): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x10394): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x104a6): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x104c0): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1054f): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x10581): undefined reference to `grub_strrchr'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x105d8): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x10615): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x10621): undefined reference to `grub_util_is_regular'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x10669): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x106ec): undefined reference to `grub_util_path_concat_ext'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x10713): undefined reference to `grub_util_path_concat_ext'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1077b): undefined reference to `grub_util_fopen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x107bb): undefined reference to `xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x107f3): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x10806): undefined reference to `grub_util_fopen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1085d): undefined reference to `grub_util_path_concat_ext'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1086e): undefined reference to `grub_util_fopen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x108cf): undefined reference to `grub_strlen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x108f9): undefined reference to `grub_strlen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x10932): undefined reference to `grub_strlen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1094d): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x10ac2): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x10c2a): undefined reference to `grub_util_file_sync'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x10cf0): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x10d15): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x10d23): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x10dc8): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x10dd4): undefined reference to `grub_util_is_special_file'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x10de1): undefined reference to `grub_util_is_directory'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x10df8): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x10efc): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x10f11): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x10f48): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x10f5d): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x10fa9): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x11043): undefined reference to `grub_util_fd_strerror'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x11056): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x11079): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x11089): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1109b): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x110bc): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mknetdir.fEFGCb.ltrans0.ltrans.o:<artificial>:(.text+0x110dd): more undefined references to `grub_util_error' follow
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mknetdir.fEFGCb.ltrans0.ltrans.o: in function `process_input_dir':
<artificial>:(.text+0x11106): undefined reference to `grub_util_fd_strerror'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1111b): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mknetdir.fEFGCb.ltrans0.ltrans.o: in function `main':
<artificial>:(.text.startup+0x14): undefined reference to `set_program_name'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x43): undefined reference to `grub_util_disable_fd_syncs'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x4e): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x6c): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x8b): undefined reference to `argp_parse'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xa6): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xb6): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x198): undefined reference to `xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1ad): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1c0): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1c9): undefined reference to `grub_util_is_directory'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x209): undefined reference to `xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x21e): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x231): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x23a): undefined reference to `grub_util_is_directory'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x27b): undefined reference to `xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x290): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x2a3): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x2ac): undefined reference to `grub_util_is_directory'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x2ff): undefined reference to `xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x314): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x327): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x330): undefined reference to `grub_util_is_directory'
collect2: error: ld returned 1 exit status
make[2]: *** [Makefile:4629: grub-mknetdir] Error 1
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans0.ltrans.o: in function `SzAlloc':
<artificial>:(.text+0x85): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans0.ltrans.o: in function `finish_reloc_translation_raw.isra.0.lto_priv.0':
<artificial>:(.text+0xe0): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x17f): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans0.ltrans.o: in function `add_fixup_entry.lto_priv.0':
<artificial>:(.text+0x211): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x264): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2a2): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3a1): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x41d): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans0.ltrans.o: in function `add_fixup_entry.lto_priv.1':
<artificial>:(.text+0x4a1): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4f8): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x539): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x649): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6be): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans0.ltrans.o: in function `put_section32.isra.0':
<artificial>:(.text+0xaed): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans0.ltrans.o: in function `put_section64.isra.0':
<artificial>:(.text+0x1041): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans0.ltrans.o: in function `create_u64_fixups.lto_priv.1':
<artificial>:(.text+0x12b9): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x12f1): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x132c): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x139b): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans0.ltrans.o: in function `create_u64_fixups.lto_priv.0':
<artificial>:(.text+0x1501): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1536): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x156d): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x15de): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans0.ltrans.o: in function `grub_install_compress_lzop':
<artificial>:(.text+0x1626): undefined reference to `grub_util_exec_redirect'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans0.ltrans.o: in function `grub_install_compress_xz':
<artificial>:(.text+0x1673): undefined reference to `grub_util_exec_redirect'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans0.ltrans.o: in function `grub_install_compress_gzip':
<artificial>:(.text+0x16b6): undefined reference to `grub_util_exec_redirect'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans0.ltrans.o: in function `add_module':
<artificial>:(.text+0x172e): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x17d1): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x17e9): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x182f): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x18c8): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x18f9): undefined reference to `grub_util_get_path'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x191d): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans0.ltrans.o: in function `grub_util_resolve_dependencies.constprop.0':
<artificial>:(.text+0x1970): undefined reference to `grub_util_get_path'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1981): undefined reference to `grub_util_fopen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x19e9): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x19f7): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1a32): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1a5a): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1a74): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1a80): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1be0): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1bf6): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans0.ltrans.o: in function `grub_host_open':
<artificial>:(.text+0x1c0b): undefined reference to `grub_strcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1c3f): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans0.ltrans.o: in function `grub_hostfs_close':
<artificial>:(.text+0x1c5a): undefined reference to `grub_util_fd_close'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1c64): undefined reference to `grub_free'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1c6d): undefined reference to `grub_free'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans0.ltrans.o: in function `grub_hostfs_read':
<artificial>:(.text+0x1c9e): undefined reference to `grub_util_fd_seek'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1cb2): undefined reference to `grub_util_fd_read'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1cc2): undefined reference to `grub_util_fd_strerror'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1cdb): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1cf2): undefined reference to `grub_util_fd_strerror'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1d0b): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans0.ltrans.o: in function `grub_hostfs_open':
<artificial>:(.text+0x1d37): undefined reference to `grub_util_fd_open'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1d49): undefined reference to `grub_malloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1d5a): undefined reference to `grub_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1d79): undefined reference to `grub_util_get_fd_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1dbc): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1dc5): undefined reference to `grub_free'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1dce): undefined reference to `grub_util_fd_close'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1dd4): undefined reference to `grub_errno'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans0.ltrans.o: in function `grub_hostfs_dir':
<artificial>:(.text+0x1e16): undefined reference to `grub_strcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1e62): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1ea8): undefined reference to `grub_util_is_directory'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1eef): undefined reference to `grub_memset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1f2e): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1f4a): undefined reference to `grub_util_fd_strerror'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1f62): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans0.ltrans.o: in function `clean_grub_dir':
<artificial>:(.text+0x2065): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2118): undefined reference to `grub_util_fd_strerror'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x212b): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2131): undefined reference to `grub_util_fd_strerror'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2144): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans0.ltrans.o: in function `grub_util_unlink_recursive':
<artificial>:(.text+0x218e): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x219a): undefined reference to `grub_util_is_special_file'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x21a7): undefined reference to `grub_util_is_regular'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x21b4): undefined reference to `grub_util_is_directory'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans0.ltrans.o: in function `grub_install_mkdir_p':
<artificial>:(.text+0x2228): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans0.ltrans.o: in function `grub_install_copy_file':
<artificial>:(.text+0x22c3): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x22ce): undefined reference to `grub_util_fd_open'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x22e1): undefined reference to `grub_util_fd_strerror'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x22f4): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x231c): undefined reference to `grub_util_fd_open'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x234c): undefined reference to `grub_util_fd_write'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2368): undefined reference to `grub_util_fd_read'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x237e): undefined reference to `grub_util_fd_sync'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x238a): undefined reference to `grub_util_fd_close'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x23a1): undefined reference to `grub_util_fd_close'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x23ca): undefined reference to `grub_util_fd_close'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x23d3): undefined reference to `grub_util_fd_close'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x23d9): undefined reference to `grub_util_fd_strerror'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x23ef): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x23ff): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2414): undefined reference to `grub_util_fd_strerror'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2427): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x242d): undefined reference to `grub_util_fd_strerror'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2440): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans0.ltrans.o: in function `grub_install_compress_file.constprop.0':
<artificial>:(.text+0x2474): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x24af): undefined reference to `grub_util_warn'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x24ba): undefined reference to `grub_util_fd_strerror'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x24d0): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans0.ltrans.o: in function `grub_install_compress_file':
<artificial>:(.text+0x251e): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x257f): undefined reference to `grub_util_warn'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2587): undefined reference to `grub_util_fd_strerror'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x259d): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans0.ltrans.o: in function `grub_install_copy_files':
<artificial>:(.text+0x260a): undefined reference to `xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2620): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2641): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x264f): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x271e): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2734): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2810): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2826): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2884): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x28be): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x28ca): undefined reference to `grub_util_is_regular'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x290e): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x297e): undefined reference to `grub_util_path_concat_ext'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x29a7): undefined reference to `grub_util_path_concat_ext'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2a5f): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2a91): undefined reference to `grub_strrchr'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2ae1): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2b06): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2b14): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2bb9): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2bc5): undefined reference to `grub_util_is_special_file'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2bd2): undefined reference to `grub_util_is_directory'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2bea): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2d2c): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2d41): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2d7c): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2d91): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2ddd): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2ded): undefined reference to `grub_util_fd_strerror'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2e00): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2e06): undefined reference to `grub_util_fd_strerror'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2e19): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans0.ltrans.o: in function `grub_mkimage_load_image64':
<artificial>:(.text+0x385b): undefined reference to `grub_memset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x386c): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3878): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x388c): undefined reference to `grub_util_load_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x38bb): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x39e3): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3a0a): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3d92): undefined reference to `grub_xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3da2): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x446d): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4606): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4ad1): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4b25): undefined reference to `grub_arm64_dl_get_tramp_got_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4e63): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4f11): undefined reference to `grub_strcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4f45): undefined reference to `grub_strcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4f7b): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x50e9): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x51a8): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x52fb): undefined reference to `grub_ia64_add_value_to_slot_21'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x535c): undefined reference to `grub_ia64_make_trampoline'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x539e): undefined reference to `grub_ia64_add_value_to_slot_20b'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5401): undefined reference to `grub_ia64_set_immu64'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5419): undefined reference to `grub_ia64_add_value_to_slot_21'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5453): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x547d): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5572): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x55bc): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x55e3): undefined reference to `grub_arm_64_check_xxxx26_offset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x55f7): undefined reference to `grub_arm64_set_xxxx26_offset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x566c): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x569b): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x56d1): undefined reference to `grub_arm64_check_hi21_signed'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x56e5): undefined reference to `grub_arm64_set_hi21'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5763): undefined reference to `grub_arm64_check_hi21_signed'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5779): undefined reference to `grub_arm64_set_hi21'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x580e): undefined reference to `grub_arm64_set_abs_lo12_ldst64'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x587d): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5892): undefined reference to `grub_arm64_set_abs_lo12'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x58a8): undefined reference to `grub_arm64_set_abs_lo12_ldst64'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5fd1): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6079): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x61b0): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x652a): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6695): undefined reference to `grub_memset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6714): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6723): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x682d): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x685c): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x68b4): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6946): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x69d8): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6a8b): undefined reference to `xrealloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6ca8): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6ce0): undefined reference to `grub_ia64_dl_get_tramp_got_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6dfd): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6eea): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x713f): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x71e9): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7200): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7221): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x722e): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x723e): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans0.ltrans.o:<artificial>:(.text+0x724e): more undefined references to `grub_util_error' follow
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans0.ltrans.o: in function `grub_mkimage_load_image32':
<artificial>:(.text+0x731b): undefined reference to `grub_memset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x732c): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7338): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x734c): undefined reference to `grub_util_load_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7368): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7462): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7489): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x79a9): undefined reference to `grub_xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x79b9): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7c66): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7d67): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8048): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x80f4): undefined reference to `grub_strcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x811f): undefined reference to `grub_strcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x814c): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x829c): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8408): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x84a5): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x85e8): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8b28): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8b3c): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8ba3): undefined reference to `grub_arm_thm_call_get_offset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8bc4): undefined reference to `grub_real_dprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8bf5): undefined reference to `grub_real_dprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8c2b): undefined reference to `grub_real_dprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8c36): undefined reference to `grub_arm_thm_call_set_offset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8c43): undefined reference to `grub_errmsg'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8c50): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8c64): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8d11): undefined reference to `grub_arm_jump24_get_offset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8d1d): undefined reference to `grub_arm_jump24_check_offset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8d33): undefined reference to `grub_arm_jump24_set_offset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8d4b): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8d9d): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8e00): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8e34): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8e9e): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8ece): undefined reference to `grub_arm_thm_jump19_get_offset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8eda): undefined reference to `grub_arm_thm_jump19_check_offset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8ef0): undefined reference to `grub_arm_thm_jump19_set_offset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8f24): undefined reference to `grub_arm_jump24_check_offset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8f93): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8faa): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9119): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x915f): undefined reference to `grub_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x951d): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9711): undefined reference to `grub_memset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9795): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x97a4): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x989c): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x98cb): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x990f): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x99a0): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x99bc): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x99d4): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9a2d): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9afa): undefined reference to `xrealloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9e6e): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa154): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa240): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa382): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa3eb): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa3fb): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa417): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa454): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa464): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans0.ltrans.o:<artificial>:(.text+0xa471): more undefined references to `grub_util_error' follow
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans0.ltrans.o: in function `grub_install_generate_image.constprop.0':
<artificial>:(.text+0xa523): undefined reference to `grub_util_get_path'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa576): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa5a2): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa5b1): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa5d8): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa5f0): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa617): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa646): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa668): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa680): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa6ab): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa6b6): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa6db): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa6fb): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa71e): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa75e): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa799): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa7c1): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa7fe): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa833): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa9cd): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xaa0e): undefined reference to `grub_util_load_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xaa55): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xaa99): undefined reference to `grub_util_load_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xab12): undefined reference to `grub_util_load_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xab69): undefined reference to `grub_util_load_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xabac): undefined reference to `grub_strcpy'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xabc4): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xac09): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xac41): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xac74): undefined reference to `grub_util_get_path'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xac80): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xac8c): undefined reference to `grub_util_read_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xad42): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xaf43): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xb4d9): undefined reference to `grub_util_write_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xb580): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xb59f): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xb5d6): undefined reference to `_gcry_digest_spec_crc32'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xb602): undefined reference to `grub_crypto_hash'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xb613): undefined reference to `_gcry_digest_spec_crc32'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xb619): undefined reference to `grub_crypto_hash'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xb64b): undefined reference to `grub_util_get_path'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xb666): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xb67b): undefined reference to `grub_util_read_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xb6a6): undefined reference to `grub_util_write_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xb6d2): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xb6e5): undefined reference to `grub_memset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xb784): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xbafd): undefined reference to `grub_util_get_path'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xbb09): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xbb1e): undefined reference to `grub_util_read_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xbb60): undefined reference to `grub_util_write_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xbb87): undefined reference to `grub_util_get_path'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xbb93): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xbba3): undefined reference to `grub_util_read_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xbbc5): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xbc77): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xbd22): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xbd34): undefined reference to `grub_memset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xbdb4): undefined reference to `grub_memmove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xbe62): undefined reference to `grub_util_get_path'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xbe6e): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xbe7a): undefined reference to `grub_util_read_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xbe87): undefined reference to `_gcry_digest_spec_sha512'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xbe96): undefined reference to `grub_crypto_hash'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xbe9d): undefined reference to `_gcry_digest_spec_sha512'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xbeae): undefined reference to `grub_memcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xbed9): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xbfd4): undefined reference to `LzmaEncProps_Init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc00a): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc055): undefined reference to `LzmaEncode'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc07f): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc136): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc2b5): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc88f): undefined reference to `grub_util_get_path'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc903): undefined reference to `grub_util_warn'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xcbfa): undefined reference to `grub_util_get_path'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xcc06): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xcc13): undefined reference to `grub_util_read_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xcc2d): undefined reference to `grub_util_write_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xccb6): undefined reference to `grub_util_get_path'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xccc2): undefined reference to `grub_util_get_image_size'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xcccf): undefined reference to `grub_util_read_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xcce9): undefined reference to `grub_util_write_image'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xcf7c): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd276): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd5e9): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd727): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xdbca): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xdc44): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xdc58): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xdc6a): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xdc82): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans0.ltrans.o:<artificial>:(.text+0xdc94): more undefined references to `grub_util_error' follow
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans0.ltrans.o: in function `handle_install_list.constprop.0':
<artificial>:(.text+0xdd52): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xdd82): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xddaf): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xddca): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xde07): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xde1f): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans0.ltrans.o: in function `grub_mod_fini.lto_priv.1':
<artificial>:(.text+0xdf77): undefined reference to `grub_disk_dev_unregister'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans0.ltrans.o: in function `grub_mod_init.lto_priv.1':
<artificial>:(.text+0xdf87): undefined reference to `grub_disk_dev_register'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans0.ltrans.o: in function `grub_mod_fini.lto_priv.0':
<artificial>:(.text+0xdf97): undefined reference to `grub_list_remove'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans0.ltrans.o: in function `grub_mod_init.lto_priv.0':
<artificial>:(.text+0xdfa6): undefined reference to `grub_fs_list'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xdfac): undefined reference to `grub_list_push'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans0.ltrans.o: in function `grub_install_push_module':
<artificial>:(.text+0xdffe): undefined reference to `xrealloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xe024): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans0.ltrans.o: in function `grub_install_make_image_wrap_file.constprop.0':
<artificial>:(.text+0xe0c7): undefined reference to `grub_strlen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xe0f9): undefined reference to `grub_strlen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xe132): undefined reference to `grub_strlen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xe14d): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xe2d0): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xe4b9): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans0.ltrans.o: in function `grub_install_make_image_wrap.constprop.0':
<artificial>:(.text+0xe4e7): undefined reference to `grub_util_fopen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xe50f): undefined reference to `grub_util_file_sync'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xe54b): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xe56c): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans0.ltrans.o: in function `make_image_fwdisk_abs.part.0.lto_priv.0':
<artificial>:(.text+0xe58a): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xe590): undefined reference to `grub_util_make_temporary_file'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xe5a1): undefined reference to `grub_util_fopen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans0.ltrans.o: in function `main':
<artificial>:(.text.startup+0x26): undefined reference to `set_program_name'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x55): undefined reference to `grub_util_disable_fd_syncs'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x76): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x88): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x9a): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xb6): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xc6): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xd2): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1f1): undefined reference to `argp_parse'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x217): undefined reference to `grub_init_all'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x221): undefined reference to `grub_fs_list'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x227): undefined reference to `grub_list_push'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x232): undefined reference to `grub_disk_dev_register'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x262): undefined reference to `grub_util_make_temporary_dir'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x279): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x297): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x2bf): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x2f4): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x304): undefined reference to `grub_util_fd_open'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x327): undefined reference to `grub_util_fd_read'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x33c): undefined reference to `grub_util_fd_close'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x36e): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x39f): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x3dc): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x414): undefined reference to `grub_isspace'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x588): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x7c0): undefined reference to `xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x7d5): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x7e1): undefined reference to `grub_util_is_directory'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x86c): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x8ae): undefined reference to `grub_snprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x8c9): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x97a): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x983): undefined reference to `grub_util_make_temporary_file'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x998): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x9a6): undefined reference to `grub_util_fopen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xad8): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xafc): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xb0d): undefined reference to `grub_util_fopen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xb34): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xb45): undefined reference to `grub_util_fopen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xb8d): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xbab): undefined reference to `xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xc34): undefined reference to `grub_util_fopen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xc58): undefined reference to `grub_video_parse_color'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xc73): undefined reference to `grub_video_parse_color'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1282): undefined reference to `grub_canonicalize_file_name'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x129e): undefined reference to `xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x12b2): undefined reference to `grub_font_loader_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x12bd): undefined reference to `grub_font_load'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x12d9): undefined reference to `grub_font_get_string_width'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x12f0): undefined reference to `grub_font_get_height'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1346): undefined reference to `grub_video_capture_start'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x135b): undefined reference to `grub_video_map_rgb'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1374): undefined reference to `grub_video_map_rgb'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1393): undefined reference to `grub_video_capture_get_framebuffer'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x13ae): undefined reference to `grub_memset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x13cd): undefined reference to `grub_font_draw_string'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1404): undefined reference to `grub_video_capture_get_framebuffer'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1420): undefined reference to `grub_video_capture_end'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x145b): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x146c): undefined reference to `grub_util_fopen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x14d7): undefined reference to `grub_util_make_temporary_dir'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x14f4): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1513): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1547): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x158e): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x15d3): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans0.ltrans.o:<artificial>:(.text.startup+0x160e): more undefined references to `grub_util_path_concat' follow
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans0.ltrans.o: in function `main':
<artificial>:(.text.startup+0x1774): undefined reference to `grub_util_fopen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1792): undefined reference to `grub_util_fopen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x17b7): undefined reference to `grub_util_fopen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x18e8): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1939): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x197f): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1a63): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1ab3): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1ac8): undefined reference to `grub_util_warn'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1ace): undefined reference to `grub_util_make_temporary_file'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1adf): undefined reference to `grub_util_fopen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1af9): undefined reference to `grub_util_fopen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1b8c): undefined reference to `grub_util_fd_sync'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1bb0): undefined reference to `grub_util_warn'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1cb2): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1d2c): undefined reference to `grub_util_exec'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1d95): undefined reference to `grub_util_exec'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1e3e): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1e5a): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1e72): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1e95): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1eb6): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans0.ltrans.o:<artificial>:(.text.startup+0x20ab): more undefined references to `grub_util_path_concat' follow
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans0.ltrans.o: in function `main':
<artificial>:(.text.startup+0x2186): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x21c7): undefined reference to `xrealloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x2201): undefined reference to `grub_util_exec'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x22e5): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x22f7): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x2368): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x2389): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x23c2): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans0.ltrans.o:<artificial>:(.text.startup+0x23d4): more undefined references to `grub_util_error' follow
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans0.ltrans.o: in function `main':
<artificial>:(.text.startup+0x243a): undefined reference to `grub_util_make_temporary_file'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x2456): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x2467): undefined reference to `grub_util_fopen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x2481): undefined reference to `grub_util_fopen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x2590): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x2609): undefined reference to `xmalloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x26c1): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x2717): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x273a): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x274c): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x275e): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans0.ltrans.o:<artificial>:(.text.startup+0x2781): more undefined references to `grub_util_error' follow
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans0.ltrans.o: in function `main':
<artificial>:(.text.startup+0x27e5): undefined reference to `grub_errmsg'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x27f2): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans1.ltrans.o: in function `argp_parser.lto_priv.0':
<artificial>:(.text+0x56): undefined reference to `verbosity'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6f): undefined reference to `grub_strcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa7): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xf3): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x16f): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x193): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1bc): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans1.ltrans.o:<artificial>:(.text+0x246): more undefined references to `xstrdup' follow
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans1.ltrans.o: in function `argp_parser.lto_priv.0':
<artificial>:(.text+0x360): undefined reference to `xrealloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x386): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3ca): undefined reference to `grub_strcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x459): undefined reference to `grub_strcmp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x47c): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x48c): undefined reference to `grub_util_error'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans1.ltrans.o: in function `help_filter.lto_priv.0':
<artificial>:(.text+0x4d6): undefined reference to `xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4f3): undefined reference to `xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x547): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x55e): undefined reference to `xasprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans1.ltrans.o: in function `make_image_fwdisk.lto_priv.0':
<artificial>:(.text+0x59a): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans1.ltrans.o: in function `check_xorriso.lto_priv.0':
<artificial>:(.text+0x635): undefined reference to `grub_util_exec_pipe_stderr'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans1.ltrans.o: in function `write_part.lto_priv.0':
<artificial>:(.text+0x77c): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x78a): undefined reference to `grub_util_fopen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans1.ltrans.o: in function `make_image.lto_priv.0':
<artificial>:(.text+0xa1d): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa3f): undefined reference to `grub_util_info'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa45): undefined reference to `grub_util_make_temporary_file'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa56): undefined reference to `grub_util_fopen'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans1.ltrans.o: in function `xorriso_push.lto_priv.0':
<artificial>:(.text+0xb31): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xb53): undefined reference to `xrealloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xb77): undefined reference to `xstrdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/grub-mkrescue.eoNhCh.ltrans1.ltrans.o: in function `xorriso_link.lto_priv.0':
<artificial>:(.text+0xbad): undefined reference to `grub_util_path_concat'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xbc3): undefined reference to `xasprintf'
collect2: error: ld returned 1 exit status
make[2]: *** [Makefile:4720: grub-mkrescue] Error 1
make[2]: Leaving directory '/temporary/system/builds/grub'
make[1]: *** [Makefile:11304: all-recursive] Error 1
make[1]: Leaving directory '/temporary/system/builds/grub'
make: *** [Makefile:3343: all] Error 2
```

Doesn't build `-flto -ffat-lto-objects`:
```C
__gnu_lto_v1 in adler32 is duplicated in acpi
__gnu_lto_v1 in affs is duplicated in adler32
__gnu_lto_v1 in afs is duplicated in affs
__gnu_lto_v1 in ahci is duplicated in afs
__gnu_lto_v1 in all_video is duplicated in ahci
__gnu_lto_v1 in aout is duplicated in all_video
__gnu_lto_v1 in archelp is duplicated in aout
__gnu_lto_v1 in at_keyboard is duplicated in archelp
__gnu_lto_v1 in ata is duplicated in at_keyboard
__gnu_lto_v1 in backtrace is duplicated in ata
__gnu_lto_v1 in bfs is duplicated in backtrace
__gnu_lto_v1 in biosdisk is duplicated in bfs
__gnu_lto_v1 in bitmap is duplicated in biosdisk
__gnu_lto_v1 in bitmap_scale is duplicated in bitmap
__gnu_lto_v1 in blocklist is duplicated in bitmap_scale
__gnu_lto_v1 in boot is duplicated in blocklist
__gnu_lto_v1 in bsd is duplicated in boot
__gnu_lto_v1 in bswap_test is duplicated in bsd
__gnu_lto_v1 in btrfs is duplicated in bswap_test
__gnu_lto_v1 in bufio is duplicated in btrfs
__gnu_lto_v1 in cat is duplicated in bufio
__gnu_lto_v1 in cbfs is duplicated in cat
__gnu_lto_v1 in cbls is duplicated in cbfs
__gnu_lto_v1 in cbmemc is duplicated in cbls
__gnu_lto_v1 in cbtable is duplicated in cbmemc
__gnu_lto_v1 in cbtime is duplicated in cbtable
__gnu_lto_v1 in chain is duplicated in cbtime
__gnu_lto_v1 in cmdline_cat_test is duplicated in chain
__gnu_lto_v1 in cmosdump is duplicated in cmdline_cat_test
__gnu_lto_v1 in cmostest is duplicated in cmosdump
__gnu_lto_v1 in cmp is duplicated in cmostest
__gnu_lto_v1 in cmp_test is duplicated in cmp
__gnu_lto_v1 in configfile is duplicated in cmp_test
__gnu_lto_v1 in cpio is duplicated in configfile
__gnu_lto_v1 in cpio_be is duplicated in cpio
__gnu_lto_v1 in cpuid is duplicated in cpio_be
__gnu_lto_v1 in crc64 is duplicated in cpuid
__gnu_lto_v1 in crypto is duplicated in crc64
__gnu_lto_v1 in cryptodisk is duplicated in crypto
__gnu_lto_v1 in cs5536 is duplicated in cryptodisk
__gnu_lto_v1 in ctz_test is duplicated in cs5536
__gnu_lto_v1 in date is duplicated in ctz_test
__gnu_lto_v1 in datehook is duplicated in date
__gnu_lto_v1 in datetime is duplicated in datehook
__gnu_lto_v1 in disk is duplicated in datetime
__gnu_lto_v1 in diskfilter is duplicated in disk
__gnu_lto_v1 in div is duplicated in diskfilter
__gnu_lto_v1 in div_test is duplicated in div
__gnu_lto_v1 in dm_nv is duplicated in div_test
__gnu_lto_v1 in echo is duplicated in dm_nv
__gnu_lto_v1 in efiemu is duplicated in echo
__gnu_lto_v1 in ehci is duplicated in efiemu
__gnu_lto_v1 in elf is duplicated in ehci
__gnu_lto_v1 in eval is duplicated in elf
__gnu_lto_v1 in exfat is duplicated in eval
__gnu_lto_v1 in exfctest is duplicated in exfat
__gnu_lto_v1 in ext2 is duplicated in exfctest
__gnu_lto_v1 in extcmd is duplicated in ext2
__gnu_lto_v1 in f2fs is duplicated in extcmd
__gnu_lto_v1 in fat is duplicated in f2fs
__gnu_lto_v1 in file is duplicated in fat
__gnu_lto_v1 in font is duplicated in file
__gnu_lto_v1 in freedos is duplicated in font
__gnu_lto_v1 in fshelp is duplicated in freedos
__gnu_lto_v1 in functional_test is duplicated in fshelp
__gnu_lto_v1 in gcry_arcfour is duplicated in functional_test
__gnu_lto_v1 in gcry_blowfish is duplicated in gcry_arcfour
__gnu_lto_v1 in gcry_camellia is duplicated in gcry_blowfish
__gnu_lto_v1 in gcry_cast5 is duplicated in gcry_camellia
__gnu_lto_v1 in gcry_crc is duplicated in gcry_cast5
__gnu_lto_v1 in gcry_des is duplicated in gcry_crc
__gnu_lto_v1 in gcry_dsa is duplicated in gcry_des
__gnu_lto_v1 in gcry_idea is duplicated in gcry_dsa
__gnu_lto_v1 in gcry_md4 is duplicated in gcry_idea
__gnu_lto_v1 in gcry_md5 is duplicated in gcry_md4
__gnu_lto_v1 in gcry_rfc2268 is duplicated in gcry_md5
__gnu_lto_v1 in gcry_rijndael is duplicated in gcry_rfc2268
__gnu_lto_v1 in gcry_rmd160 is duplicated in gcry_rijndael
__gnu_lto_v1 in gcry_rsa is duplicated in gcry_rmd160
__gnu_lto_v1 in gcry_seed is duplicated in gcry_rsa
__gnu_lto_v1 in gcry_serpent is duplicated in gcry_seed
__gnu_lto_v1 in gcry_sha1 is duplicated in gcry_serpent
__gnu_lto_v1 in gcry_sha256 is duplicated in gcry_sha1
__gnu_lto_v1 in gcry_sha512 is duplicated in gcry_sha256
__gnu_lto_v1 in gcry_tiger is duplicated in gcry_sha512
__gnu_lto_v1 in gcry_twofish is duplicated in gcry_tiger
__gnu_lto_v1 in gcry_whirlpool is duplicated in gcry_twofish
__gnu_lto_v1 in geli is duplicated in gcry_whirlpool
__gnu_lto_v1 in gettext is duplicated in geli
__gnu_lto_v1 in gfxmenu is duplicated in gettext
__gnu_lto_v1 in gfxterm is duplicated in gfxmenu
__gnu_lto_v1 in gfxterm_background is duplicated in gfxterm
__gnu_lto_v1 in gfxterm_menu is duplicated in gfxterm_background
__gnu_lto_v1 in gptsync is duplicated in gfxterm_menu
__gnu_lto_v1 in gzio is duplicated in gptsync
__gnu_lto_v1 in halt is duplicated in gzio
__gnu_lto_v1 in hashsum is duplicated in halt
__gnu_lto_v1 in hdparm is duplicated in hashsum
__gnu_lto_v1 in hello is duplicated in hdparm
__gnu_lto_v1 in help is duplicated in hello
__gnu_lto_v1 in hexdump is duplicated in help
__gnu_lto_v1 in hfs is duplicated in hexdump
__gnu_lto_v1 in hfsplus is duplicated in hfs
__gnu_lto_v1 in hfspluscomp is duplicated in hfsplus
__gnu_lto_v1 in http is duplicated in hfspluscomp
__gnu_lto_v1 in iorw is duplicated in http
__gnu_lto_v1 in iso9660 is duplicated in iorw
__gnu_lto_v1 in jfs is duplicated in iso9660
__gnu_lto_v1 in jpeg is duplicated in jfs
__gnu_lto_v1 in keylayouts is duplicated in jpeg
__gnu_lto_v1 in keystatus is duplicated in keylayouts
__gnu_lto_v1 in ldm is duplicated in keystatus
__gnu_lto_v1 in legacy_password_test is duplicated in ldm
__gnu_lto_v1 in legacycfg is duplicated in legacy_password_test
__gnu_lto_v1 in linux is duplicated in legacycfg
__gnu_lto_v1 in linux16 is duplicated in linux
__gnu_lto_v1 in loadenv is duplicated in linux16
__gnu_lto_v1 in loopback is duplicated in loadenv
__gnu_lto_v1 in ls is duplicated in loopback
__gnu_lto_v1 in lsacpi is duplicated in ls
__gnu_lto_v1 in lsapm is duplicated in lsacpi
__gnu_lto_v1 in lsmmap is duplicated in lsapm
__gnu_lto_v1 in lspci is duplicated in lsmmap
__gnu_lto_v1 in luks is duplicated in lspci
__gnu_lto_v1 in lvm is duplicated in luks
__gnu_lto_v1 in lzopio is duplicated in lvm
__gnu_lto_v1 in macbless is duplicated in lzopio
__gnu_lto_v1 in macho is duplicated in macbless
__gnu_lto_v1 in mda_text is duplicated in macho
__gnu_lto_v1 in mdraid09 is duplicated in mda_text
__gnu_lto_v1 in mdraid09_be is duplicated in mdraid09
__gnu_lto_v1 in mdraid1x is duplicated in mdraid09_be
__gnu_lto_v1 in memdisk is duplicated in mdraid1x
__gnu_lto_v1 in memrw is duplicated in memdisk
__gnu_lto_v1 in minicmd is duplicated in memrw
__gnu_lto_v1 in minix is duplicated in minicmd
__gnu_lto_v1 in minix2 is duplicated in minix
__gnu_lto_v1 in minix2_be is duplicated in minix2
__gnu_lto_v1 in minix3 is duplicated in minix2_be
__gnu_lto_v1 in minix3_be is duplicated in minix3
__gnu_lto_v1 in minix_be is duplicated in minix3_be
__gnu_lto_v1 in morse is duplicated in minix_be
__gnu_lto_v1 in mpi is duplicated in morse
__gnu_lto_v1 in msdospart is duplicated in mpi
__gnu_lto_v1 in mul_test is duplicated in msdospart
__gnu_lto_v1 in multiboot is duplicated in mul_test
__gnu_lto_v1 in multiboot2 is duplicated in multiboot
__gnu_lto_v1 in nativedisk is duplicated in multiboot2
__gnu_lto_v1 in net is duplicated in nativedisk
__gnu_lto_v1 in newc is duplicated in net
__gnu_lto_v1 in nilfs2 is duplicated in newc
__gnu_lto_v1 in normal is duplicated in nilfs2
__gnu_lto_v1 in ntfs is duplicated in normal
__gnu_lto_v1 in ntfscomp is duplicated in ntfs
__gnu_lto_v1 in ntldr is duplicated in ntfscomp
__gnu_lto_v1 in odc is duplicated in ntldr
__gnu_lto_v1 in offsetio is duplicated in odc
__gnu_lto_v1 in ohci is duplicated in offsetio
__gnu_lto_v1 in part_acorn is duplicated in ohci
__gnu_lto_v1 in part_amiga is duplicated in part_acorn
__gnu_lto_v1 in part_apple is duplicated in part_amiga
__gnu_lto_v1 in part_bsd is duplicated in part_apple
__gnu_lto_v1 in part_dfly is duplicated in part_bsd
__gnu_lto_v1 in part_dvh is duplicated in part_dfly
__gnu_lto_v1 in part_gpt is duplicated in part_dvh
__gnu_lto_v1 in part_msdos is duplicated in part_gpt
__gnu_lto_v1 in part_plan is duplicated in part_msdos
__gnu_lto_v1 in part_sun is duplicated in part_plan
__gnu_lto_v1 in part_sunpc is duplicated in part_sun
__gnu_lto_v1 in parttool is duplicated in part_sunpc
__gnu_lto_v1 in password is duplicated in parttool
__gnu_lto_v1 in password_pbkdf2 is duplicated in password
__gnu_lto_v1 in pata is duplicated in password_pbkdf2
__gnu_lto_v1 in pbkdf2 is duplicated in pata
__gnu_lto_v1 in pbkdf2_test is duplicated in pbkdf2
__gnu_lto_v1 in pci is duplicated in pbkdf2_test
__gnu_lto_v1 in pcidump is duplicated in pci
__gnu_lto_v1 in pgp is duplicated in pcidump
__gnu_lto_v1 in plan9 is duplicated in pgp
__gnu_lto_v1 in play is duplicated in plan9
__gnu_lto_v1 in png is duplicated in play
__gnu_lto_v1 in priority_queue is duplicated in png
__gnu_lto_v1 in probe is duplicated in priority_queue
__gnu_lto_v1 in procfs is duplicated in probe
__gnu_lto_v1 in progress is duplicated in procfs
__gnu_lto_v1 in pxe is duplicated in progress
__gnu_lto_v1 in pxechain is duplicated in pxe
__gnu_lto_v1 in raid5rec is duplicated in pxechain
__gnu_lto_v1 in raid6rec is duplicated in raid5rec
__gnu_lto_v1 in random is duplicated in raid6rec
__gnu_lto_v1 in rdmsr is duplicated in random
__gnu_lto_v1 in read is duplicated in rdmsr
__gnu_lto_v1 in regexp is duplicated in read
__gnu_lto_v1 in reiserfs is duplicated in regexp
__gnu_lto_v1 in romfs is duplicated in reiserfs
__gnu_lto_v1 in scsi is duplicated in romfs
__gnu_lto_v1 in search is duplicated in scsi
__gnu_lto_v1 in search_fs_file is duplicated in search
__gnu_lto_v1 in search_fs_uuid is duplicated in search_fs_file
__gnu_lto_v1 in search_label is duplicated in search_fs_uuid
__gnu_lto_v1 in sendkey is duplicated in search_label
__gnu_lto_v1 in serial is duplicated in sendkey
__gnu_lto_v1 in setjmp_test is duplicated in serial
__gnu_lto_v1 in setpci is duplicated in setjmp_test
__gnu_lto_v1 in sfs is duplicated in setpci
__gnu_lto_v1 in shift_test is duplicated in sfs
__gnu_lto_v1 in signature_test is duplicated in shift_test
__gnu_lto_v1 in sleep is duplicated in signature_test
__gnu_lto_v1 in sleep_test is duplicated in sleep
__gnu_lto_v1 in spkmodem is duplicated in sleep_test
__gnu_lto_v1 in squash4 is duplicated in spkmodem
__gnu_lto_v1 in strtoull_test is duplicated in squash4
__gnu_lto_v1 in syslinuxcfg is duplicated in strtoull_test
__gnu_lto_v1 in tar is duplicated in syslinuxcfg
__gnu_lto_v1 in terminal is duplicated in tar
__gnu_lto_v1 in terminfo is duplicated in terminal
__gnu_lto_v1 in test is duplicated in terminfo
__gnu_lto_v1 in test_blockarg is duplicated in test
__gnu_lto_v1 in testload is duplicated in test_blockarg
__gnu_lto_v1 in testspeed is duplicated in testload
__gnu_lto_v1 in tftp is duplicated in testspeed
__gnu_lto_v1 in tga is duplicated in tftp
__gnu_lto_v1 in time is duplicated in tga
__gnu_lto_v1 in tr is duplicated in time
__gnu_lto_v1 in trig is duplicated in tr
__gnu_lto_v1 in true is duplicated in trig
__gnu_lto_v1 in truecrypt is duplicated in true
__gnu_lto_v1 in udf is duplicated in truecrypt
__gnu_lto_v1 in ufs1 is duplicated in udf
__gnu_lto_v1 in ufs1_be is duplicated in ufs1
__gnu_lto_v1 in ufs2 is duplicated in ufs1_be
__gnu_lto_v1 in uhci is duplicated in ufs2
__gnu_lto_v1 in usb is duplicated in uhci
__gnu_lto_v1 in usb_keyboard is duplicated in usb
__gnu_lto_v1 in usbms is duplicated in usb_keyboard
__gnu_lto_v1 in usbserial_common is duplicated in usbms
__gnu_lto_v1 in usbserial_ftdi is duplicated in usbserial_common
__gnu_lto_v1 in usbserial_pl2303 is duplicated in usbserial_ftdi
__gnu_lto_v1 in usbserial_usbdebug is duplicated in usbserial_pl2303
__gnu_lto_v1 in usbtest is duplicated in usbserial_usbdebug
__gnu_lto_v1 in vbe is duplicated in usbtest
__gnu_lto_v1 in verifiers is duplicated in vbe
__gnu_lto_v1 in vga is duplicated in verifiers
__gnu_lto_v1 in vga_text is duplicated in vga
__gnu_lto_v1 in video is duplicated in vga_text
__gnu_lto_v1 in video_bochs is duplicated in video
__gnu_lto_v1 in video_cirrus is duplicated in video_bochs
__gnu_lto_v1 in video_colors is duplicated in video_cirrus
__gnu_lto_v1 in video_fb is duplicated in video_colors
__gnu_lto_v1 in videoinfo is duplicated in video_fb
__gnu_lto_v1 in videotest is duplicated in videoinfo
__gnu_lto_v1 in videotest_checksum is duplicated in videotest
__gnu_lto_v1 in wrmsr is duplicated in videotest_checksum
__gnu_lto_v1 in xfs is duplicated in wrmsr
__gnu_lto_v1 in xnu is duplicated in xfs
__gnu_lto_v1 in xnu_uuid is duplicated in xnu
__gnu_lto_v1 in xnu_uuid_test is duplicated in xnu_uuid
__gnu_lto_v1 in xzio is duplicated in xnu_uuid_test
__gnu_lto_v1 in zfs is duplicated in xzio
__gnu_lto_v1 in zfscrypt is duplicated in zfs
__gnu_lto_v1 in zfsinfo is duplicated in zfscrypt
__gnu_lto_v1 in zstd is duplicated in zfsinfo
_GLOBAL_OFFSET_TABLE_ in acpi is not defined
_GLOBAL_OFFSET_TABLE_ in adler32 is not defined
_GLOBAL_OFFSET_TABLE_ in affs is not defined
_GLOBAL_OFFSET_TABLE_ in afs is not defined
_GLOBAL_OFFSET_TABLE_ in ahci is not defined
_GLOBAL_OFFSET_TABLE_ in aout is not defined
_GLOBAL_OFFSET_TABLE_ in archelp is not defined
_GLOBAL_OFFSET_TABLE_ in at_keyboard is not defined
_GLOBAL_OFFSET_TABLE_ in ata is not defined
_GLOBAL_OFFSET_TABLE_ in backtrace is not defined
_GLOBAL_OFFSET_TABLE_ in bfs is not defined
_GLOBAL_OFFSET_TABLE_ in biosdisk is not defined
_GLOBAL_OFFSET_TABLE_ in bitmap is not defined
_GLOBAL_OFFSET_TABLE_ in bitmap_scale is not defined
_GLOBAL_OFFSET_TABLE_ in blocklist is not defined
_GLOBAL_OFFSET_TABLE_ in boot is not defined
_GLOBAL_OFFSET_TABLE_ in bsd is not defined
_GLOBAL_OFFSET_TABLE_ in bswap_test is not defined
_GLOBAL_OFFSET_TABLE_ in btrfs is not defined
_GLOBAL_OFFSET_TABLE_ in bufio is not defined
_GLOBAL_OFFSET_TABLE_ in cat is not defined
_GLOBAL_OFFSET_TABLE_ in cbfs is not defined
_GLOBAL_OFFSET_TABLE_ in cbls is not defined
_GLOBAL_OFFSET_TABLE_ in cbmemc is not defined
_GLOBAL_OFFSET_TABLE_ in cbtable is not defined
_GLOBAL_OFFSET_TABLE_ in cbtime is not defined
_GLOBAL_OFFSET_TABLE_ in chain is not defined
_GLOBAL_OFFSET_TABLE_ in cmdline_cat_test is not defined
_GLOBAL_OFFSET_TABLE_ in cmosdump is not defined
_GLOBAL_OFFSET_TABLE_ in cmostest is not defined
_GLOBAL_OFFSET_TABLE_ in cmp is not defined
_GLOBAL_OFFSET_TABLE_ in cmp_test is not defined
_GLOBAL_OFFSET_TABLE_ in configfile is not defined
_GLOBAL_OFFSET_TABLE_ in cpio is not defined
_GLOBAL_OFFSET_TABLE_ in cpio_be is not defined
_GLOBAL_OFFSET_TABLE_ in cpuid is not defined
_GLOBAL_OFFSET_TABLE_ in crc64 is not defined
_GLOBAL_OFFSET_TABLE_ in crypto is not defined
_GLOBAL_OFFSET_TABLE_ in cryptodisk is not defined
_GLOBAL_OFFSET_TABLE_ in cs5536 is not defined
_GLOBAL_OFFSET_TABLE_ in ctz_test is not defined
_GLOBAL_OFFSET_TABLE_ in date is not defined
_GLOBAL_OFFSET_TABLE_ in datehook is not defined
_GLOBAL_OFFSET_TABLE_ in disk is not defined
_GLOBAL_OFFSET_TABLE_ in diskfilter is not defined
_GLOBAL_OFFSET_TABLE_ in div is not defined
_GLOBAL_OFFSET_TABLE_ in div_test is not defined
_GLOBAL_OFFSET_TABLE_ in dm_nv is not defined
_GLOBAL_OFFSET_TABLE_ in drivemap is not defined
_GLOBAL_OFFSET_TABLE_ in echo is not defined
_GLOBAL_OFFSET_TABLE_ in efiemu is not defined
_GLOBAL_OFFSET_TABLE_ in ehci is not defined
_GLOBAL_OFFSET_TABLE_ in elf is not defined
_GLOBAL_OFFSET_TABLE_ in eval is not defined
_GLOBAL_OFFSET_TABLE_ in exfat is not defined
_GLOBAL_OFFSET_TABLE_ in exfctest is not defined
_GLOBAL_OFFSET_TABLE_ in ext2 is not defined
_GLOBAL_OFFSET_TABLE_ in extcmd is not defined
_GLOBAL_OFFSET_TABLE_ in f2fs is not defined
_GLOBAL_OFFSET_TABLE_ in fat is not defined
_GLOBAL_OFFSET_TABLE_ in file is not defined
_GLOBAL_OFFSET_TABLE_ in font is not defined
_GLOBAL_OFFSET_TABLE_ in freedos is not defined
_GLOBAL_OFFSET_TABLE_ in fshelp is not defined
_GLOBAL_OFFSET_TABLE_ in functional_test is not defined
_GLOBAL_OFFSET_TABLE_ in gcry_arcfour is not defined
_GLOBAL_OFFSET_TABLE_ in gcry_blowfish is not defined
_GLOBAL_OFFSET_TABLE_ in gcry_camellia is not defined
_GLOBAL_OFFSET_TABLE_ in gcry_cast5 is not defined
_GLOBAL_OFFSET_TABLE_ in gcry_crc is not defined
_GLOBAL_OFFSET_TABLE_ in gcry_des is not defined
_GLOBAL_OFFSET_TABLE_ in gcry_dsa is not defined
_GLOBAL_OFFSET_TABLE_ in gcry_idea is not defined
_GLOBAL_OFFSET_TABLE_ in gcry_md4 is not defined
_GLOBAL_OFFSET_TABLE_ in gcry_md5 is not defined
_GLOBAL_OFFSET_TABLE_ in gcry_rfc2268 is not defined
_GLOBAL_OFFSET_TABLE_ in gcry_rijndael is not defined
_GLOBAL_OFFSET_TABLE_ in gcry_rmd160 is not defined
_GLOBAL_OFFSET_TABLE_ in gcry_rsa is not defined
_GLOBAL_OFFSET_TABLE_ in gcry_seed is not defined
_GLOBAL_OFFSET_TABLE_ in gcry_serpent is not defined
_GLOBAL_OFFSET_TABLE_ in gcry_sha1 is not defined
_GLOBAL_OFFSET_TABLE_ in gcry_sha256 is not defined
_GLOBAL_OFFSET_TABLE_ in gcry_sha512 is not defined
_GLOBAL_OFFSET_TABLE_ in gcry_tiger is not defined
_GLOBAL_OFFSET_TABLE_ in gcry_twofish is not defined
_GLOBAL_OFFSET_TABLE_ in gcry_whirlpool is not defined
_GLOBAL_OFFSET_TABLE_ in gdb is not defined
_GLOBAL_OFFSET_TABLE_ in geli is not defined
_GLOBAL_OFFSET_TABLE_ in gettext is not defined
_GLOBAL_OFFSET_TABLE_ in gfxmenu is not defined
_GLOBAL_OFFSET_TABLE_ in gfxterm is not defined
_GLOBAL_OFFSET_TABLE_ in gfxterm_background is not defined
_GLOBAL_OFFSET_TABLE_ in gfxterm_menu is not defined
_GLOBAL_OFFSET_TABLE_ in gptsync is not defined
_GLOBAL_OFFSET_TABLE_ in gzio is not defined
_GLOBAL_OFFSET_TABLE_ in halt is not defined
_GLOBAL_OFFSET_TABLE_ in hashsum is not defined
_GLOBAL_OFFSET_TABLE_ in hdparm is not defined
_GLOBAL_OFFSET_TABLE_ in hello is not defined
_GLOBAL_OFFSET_TABLE_ in help is not defined
_GLOBAL_OFFSET_TABLE_ in hexdump is not defined
_GLOBAL_OFFSET_TABLE_ in hfs is not defined
_GLOBAL_OFFSET_TABLE_ in hfsplus is not defined
_GLOBAL_OFFSET_TABLE_ in hfspluscomp is not defined
_GLOBAL_OFFSET_TABLE_ in http is not defined
_GLOBAL_OFFSET_TABLE_ in iorw is not defined
_GLOBAL_OFFSET_TABLE_ in iso9660 is not defined
_GLOBAL_OFFSET_TABLE_ in jfs is not defined
_GLOBAL_OFFSET_TABLE_ in jpeg is not defined
_GLOBAL_OFFSET_TABLE_ in keylayouts is not defined
_GLOBAL_OFFSET_TABLE_ in keystatus is not defined
_GLOBAL_OFFSET_TABLE_ in ldm is not defined
_GLOBAL_OFFSET_TABLE_ in legacy_password_test is not defined
_GLOBAL_OFFSET_TABLE_ in legacycfg is not defined
_GLOBAL_OFFSET_TABLE_ in linux is not defined
_GLOBAL_OFFSET_TABLE_ in linux16 is not defined
_GLOBAL_OFFSET_TABLE_ in loadenv is not defined
_GLOBAL_OFFSET_TABLE_ in loopback is not defined
_GLOBAL_OFFSET_TABLE_ in ls is not defined
_GLOBAL_OFFSET_TABLE_ in lsacpi is not defined
_GLOBAL_OFFSET_TABLE_ in lsapm is not defined
_GLOBAL_OFFSET_TABLE_ in lsmmap is not defined
_GLOBAL_OFFSET_TABLE_ in lspci is not defined
_GLOBAL_OFFSET_TABLE_ in luks is not defined
_GLOBAL_OFFSET_TABLE_ in lvm is not defined
_GLOBAL_OFFSET_TABLE_ in lzopio is not defined
_GLOBAL_OFFSET_TABLE_ in macbless is not defined
_GLOBAL_OFFSET_TABLE_ in macho is not defined
_GLOBAL_OFFSET_TABLE_ in mda_text is not defined
_GLOBAL_OFFSET_TABLE_ in mdraid09 is not defined
_GLOBAL_OFFSET_TABLE_ in mdraid09_be is not defined
_GLOBAL_OFFSET_TABLE_ in mdraid1x is not defined
_GLOBAL_OFFSET_TABLE_ in memdisk is not defined
_GLOBAL_OFFSET_TABLE_ in memrw is not defined
_GLOBAL_OFFSET_TABLE_ in minicmd is not defined
_GLOBAL_OFFSET_TABLE_ in minix is not defined
_GLOBAL_OFFSET_TABLE_ in minix2 is not defined
_GLOBAL_OFFSET_TABLE_ in minix2_be is not defined
_GLOBAL_OFFSET_TABLE_ in minix3 is not defined
_GLOBAL_OFFSET_TABLE_ in minix3_be is not defined
_GLOBAL_OFFSET_TABLE_ in minix_be is not defined
_GLOBAL_OFFSET_TABLE_ in mmap is not defined
_GLOBAL_OFFSET_TABLE_ in morse is not defined
_GLOBAL_OFFSET_TABLE_ in mpi is not defined
_GLOBAL_OFFSET_TABLE_ in msdospart is not defined
_GLOBAL_OFFSET_TABLE_ in mul_test is not defined
_GLOBAL_OFFSET_TABLE_ in multiboot is not defined
_GLOBAL_OFFSET_TABLE_ in multiboot2 is not defined
_GLOBAL_OFFSET_TABLE_ in nativedisk is not defined
_GLOBAL_OFFSET_TABLE_ in net is not defined
_GLOBAL_OFFSET_TABLE_ in newc is not defined
_GLOBAL_OFFSET_TABLE_ in nilfs2 is not defined
_GLOBAL_OFFSET_TABLE_ in normal is not defined
_GLOBAL_OFFSET_TABLE_ in ntfs is not defined
_GLOBAL_OFFSET_TABLE_ in ntfscomp is not defined
_GLOBAL_OFFSET_TABLE_ in ntldr is not defined
_GLOBAL_OFFSET_TABLE_ in odc is not defined
_GLOBAL_OFFSET_TABLE_ in offsetio is not defined
_GLOBAL_OFFSET_TABLE_ in ohci is not defined
_GLOBAL_OFFSET_TABLE_ in part_acorn is not defined
_GLOBAL_OFFSET_TABLE_ in part_amiga is not defined
_GLOBAL_OFFSET_TABLE_ in part_apple is not defined
_GLOBAL_OFFSET_TABLE_ in part_bsd is not defined
_GLOBAL_OFFSET_TABLE_ in part_dfly is not defined
_GLOBAL_OFFSET_TABLE_ in part_dvh is not defined
_GLOBAL_OFFSET_TABLE_ in part_gpt is not defined
_GLOBAL_OFFSET_TABLE_ in part_msdos is not defined
_GLOBAL_OFFSET_TABLE_ in part_plan is not defined
_GLOBAL_OFFSET_TABLE_ in part_sun is not defined
_GLOBAL_OFFSET_TABLE_ in part_sunpc is not defined
_GLOBAL_OFFSET_TABLE_ in parttool is not defined
_GLOBAL_OFFSET_TABLE_ in password is not defined
_GLOBAL_OFFSET_TABLE_ in password_pbkdf2 is not defined
_GLOBAL_OFFSET_TABLE_ in pata is not defined
_GLOBAL_OFFSET_TABLE_ in pbkdf2 is not defined
_GLOBAL_OFFSET_TABLE_ in pbkdf2_test is not defined
_GLOBAL_OFFSET_TABLE_ in pci is not defined
_GLOBAL_OFFSET_TABLE_ in pcidump is not defined
_GLOBAL_OFFSET_TABLE_ in pgp is not defined
_GLOBAL_OFFSET_TABLE_ in plan9 is not defined
_GLOBAL_OFFSET_TABLE_ in play is not defined
_GLOBAL_OFFSET_TABLE_ in png is not defined
_GLOBAL_OFFSET_TABLE_ in priority_queue is not defined
_GLOBAL_OFFSET_TABLE_ in probe is not defined
_GLOBAL_OFFSET_TABLE_ in procfs is not defined
_GLOBAL_OFFSET_TABLE_ in progress is not defined
_GLOBAL_OFFSET_TABLE_ in pxe is not defined
_GLOBAL_OFFSET_TABLE_ in pxechain is not defined
_GLOBAL_OFFSET_TABLE_ in raid5rec is not defined
_GLOBAL_OFFSET_TABLE_ in raid6rec is not defined
_GLOBAL_OFFSET_TABLE_ in random is not defined
_GLOBAL_OFFSET_TABLE_ in rdmsr is not defined
_GLOBAL_OFFSET_TABLE_ in read is not defined
_GLOBAL_OFFSET_TABLE_ in reboot is not defined
_GLOBAL_OFFSET_TABLE_ in regexp is not defined
_GLOBAL_OFFSET_TABLE_ in reiserfs is not defined
_GLOBAL_OFFSET_TABLE_ in relocator is not defined
_GLOBAL_OFFSET_TABLE_ in romfs is not defined
_GLOBAL_OFFSET_TABLE_ in scsi is not defined
_GLOBAL_OFFSET_TABLE_ in search is not defined
_GLOBAL_OFFSET_TABLE_ in search_fs_file is not defined
_GLOBAL_OFFSET_TABLE_ in search_fs_uuid is not defined
_GLOBAL_OFFSET_TABLE_ in search_label is not defined
_GLOBAL_OFFSET_TABLE_ in sendkey is not defined
_GLOBAL_OFFSET_TABLE_ in serial is not defined
_GLOBAL_OFFSET_TABLE_ in setjmp_test is not defined
_GLOBAL_OFFSET_TABLE_ in setpci is not defined
_GLOBAL_OFFSET_TABLE_ in sfs is not defined
_GLOBAL_OFFSET_TABLE_ in shift_test is not defined
_GLOBAL_OFFSET_TABLE_ in signature_test is not defined
_GLOBAL_OFFSET_TABLE_ in sleep is not defined
_GLOBAL_OFFSET_TABLE_ in sleep_test is not defined
_GLOBAL_OFFSET_TABLE_ in spkmodem is not defined
_GLOBAL_OFFSET_TABLE_ in squash4 is not defined
_GLOBAL_OFFSET_TABLE_ in strtoull_test is not defined
_GLOBAL_OFFSET_TABLE_ in syslinuxcfg is not defined
_GLOBAL_OFFSET_TABLE_ in tar is not defined
_GLOBAL_OFFSET_TABLE_ in terminal is not defined
_GLOBAL_OFFSET_TABLE_ in terminfo is not defined
_GLOBAL_OFFSET_TABLE_ in test is not defined
_GLOBAL_OFFSET_TABLE_ in test_blockarg is not defined
_GLOBAL_OFFSET_TABLE_ in testload is not defined
_GLOBAL_OFFSET_TABLE_ in testspeed is not defined
_GLOBAL_OFFSET_TABLE_ in tftp is not defined
_GLOBAL_OFFSET_TABLE_ in tga is not defined
_GLOBAL_OFFSET_TABLE_ in time is not defined
_GLOBAL_OFFSET_TABLE_ in tr is not defined
_GLOBAL_OFFSET_TABLE_ in true is not defined
_GLOBAL_OFFSET_TABLE_ in truecrypt is not defined
_GLOBAL_OFFSET_TABLE_ in udf is not defined
_GLOBAL_OFFSET_TABLE_ in ufs1 is not defined
_GLOBAL_OFFSET_TABLE_ in ufs1_be is not defined
_GLOBAL_OFFSET_TABLE_ in ufs2 is not defined
_GLOBAL_OFFSET_TABLE_ in uhci is not defined
_GLOBAL_OFFSET_TABLE_ in usb is not defined
_GLOBAL_OFFSET_TABLE_ in usb_keyboard is not defined
_GLOBAL_OFFSET_TABLE_ in usbms is not defined
_GLOBAL_OFFSET_TABLE_ in usbserial_common is not defined
_GLOBAL_OFFSET_TABLE_ in usbserial_ftdi is not defined
_GLOBAL_OFFSET_TABLE_ in usbserial_pl2303 is not defined
_GLOBAL_OFFSET_TABLE_ in usbserial_usbdebug is not defined
_GLOBAL_OFFSET_TABLE_ in usbtest is not defined
_GLOBAL_OFFSET_TABLE_ in vbe is not defined
_GLOBAL_OFFSET_TABLE_ in verifiers is not defined
_GLOBAL_OFFSET_TABLE_ in vga is not defined
_GLOBAL_OFFSET_TABLE_ in vga_text is not defined
_GLOBAL_OFFSET_TABLE_ in video is not defined
_GLOBAL_OFFSET_TABLE_ in video_bochs is not defined
_GLOBAL_OFFSET_TABLE_ in video_cirrus is not defined
_GLOBAL_OFFSET_TABLE_ in video_colors is not defined
_GLOBAL_OFFSET_TABLE_ in video_fb is not defined
_GLOBAL_OFFSET_TABLE_ in videoinfo is not defined
_GLOBAL_OFFSET_TABLE_ in videotest is not defined
_GLOBAL_OFFSET_TABLE_ in videotest_checksum is not defined
_GLOBAL_OFFSET_TABLE_ in wrmsr is not defined
_GLOBAL_OFFSET_TABLE_ in xfs is not defined
_GLOBAL_OFFSET_TABLE_ in xnu is not defined
_GLOBAL_OFFSET_TABLE_ in xnu_uuid is not defined
_GLOBAL_OFFSET_TABLE_ in xnu_uuid_test is not defined
_GLOBAL_OFFSET_TABLE_ in xzio is not defined
_GLOBAL_OFFSET_TABLE_ in zfs is not defined
_GLOBAL_OFFSET_TABLE_ in zfscrypt is not defined
_GLOBAL_OFFSET_TABLE_ in zfsinfo is not defined
_GLOBAL_OFFSET_TABLE_ in zstd is not defined
make[3]: *** [Makefile:46723: moddep.lst] Error 1
make[3]: Leaving directory '/temporary/system/builds/grub/grub-core'
make[2]: *** [Makefile:26403: all] Error 2
make[2]: Leaving directory '/temporary/system/builds/grub/grub-core'
make[1]: *** [Makefile:11304: all-recursive] Error 1
make[1]: Leaving directory '/temporary/system/builds/grub'
make: *** [Makefile:3343: all] Error 2
```
