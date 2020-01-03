# mandoc
## System
### Build
Doesn't build with `-fno-common`:
```C
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: compat_getline.o:(.bss+0x0): multiple definition of `dummy'; compat_err.o:(.bss+0x0): first defined here
collect2: error: ld returned 1 exit status
make: *** [Makefile:533: soelim] Error 1
```

It also doesn't build with `-flto`:
```C
ar: creating libmandoc.a
ar: compat_err.o: plugin needed to handle lto object
cc -o mandoc  eqn_html.o html.o man_html.o mdoc_html.o roff_html.o tbl_html.o  eqn_term.o man_term.o mdoc_term.o roff_term.o term.o term_ascii.o term_ps.o term_tab.o tbl_term.o dbm.o dbm_map.o mansearch.o dba.o dba_array.o dba_read.o dba_write.o mandocdb.o main.o manpath.o mdoc_man.o mdoc_markdown.o out.o tag.o tree.o libmandoc.a -lz
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans0.ltrans.o: in function `md_stack':
<artificial>:(.text+0xdad): undefined reference to `mandoc_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans0.ltrans.o: in function `md_pre_Dl':
<artificial>:(.text+0x20ad): undefined reference to `mandoc_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x20fd): undefined reference to `mandoc_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans0.ltrans.o: in function `md_pre_D1':
<artificial>:(.text+0x223d): undefined reference to `mandoc_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x228d): undefined reference to `mandoc_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans0.ltrans.o:<artificial>:(.text+0x2785): more undefined references to `mandoc_realloc' follow
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans0.ltrans.o: in function `pre_noarg':
<artificial>:(.text+0x290b): undefined reference to `roff_name'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans0.ltrans.o: in function `pre_li':
<artificial>:(.text+0x2a45): undefined reference to `mandoc_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans0.ltrans.o: in function `pre_lk':
<artificial>:(.text+0x2c6d): undefined reference to `mandoc_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2cdd): undefined reference to `mandoc_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans0.ltrans.o: in function `pre_in':
<artificial>:(.text+0x3025): undefined reference to `mandoc_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x304d): undefined reference to `mandoc_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans0.ltrans.o:<artificial>:(.text+0x31ad): more undefined references to `mandoc_realloc' follow
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans0.ltrans.o: in function `man_strlen':
<artificial>:(.text+0x4285): undefined reference to `mandoc_escape'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x42d9): undefined reference to `mandoc_escape'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans0.ltrans.o: in function `pre_nm':
<artificial>:(.text+0x4455): undefined reference to `mandoc_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans0.ltrans.o: in function `post_bd':
<artificial>:(.text+0x46f4): undefined reference to `roff_name'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans0.ltrans.o: in function `term_fontpush.constprop.0':
<artificial>:(.text+0x4853): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans0.ltrans.o: in function `mansearch.constprop.0':
<artificial>:(.text+0x4e5b): undefined reference to `ohash_first'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4f38): undefined reference to `ohash_delete'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x58c2): undefined reference to `ohash_next'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans0.ltrans.o: in function `dba_page_add.constprop.1':
<artificial>:(.text+0x5e14): undefined reference to `mandoc_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans0.ltrans.o: in function `print_man.lto_priv.0':
<artificial>:(.text+0x5f1c): undefined reference to `roff_name'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans0.ltrans.o: in function `print_mdoc.lto_priv.0':
<artificial>:(.text+0x62a3): undefined reference to `roff_name'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6308): undefined reference to `roff_name'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6331): undefined reference to `roff_name'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6355): undefined reference to `roff_name'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x64df): undefined reference to `mdoc_argnames'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x65ca): undefined reference to `roff_name'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans0.ltrans.o: in function `tag_put':
<artificial>:(.text+0x69a3): undefined reference to `ohash_qlookupi'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x69b3): undefined reference to `ohash_find'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6a5e): undefined reference to `ohash_qlookupi'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6a6e): undefined reference to `ohash_find'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6b14): undefined reference to `mandoc_malloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6b4d): undefined reference to `ohash_insert'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6b77): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans0.ltrans.o: in function `tag_init':
<artificial>:(.text+0x6ca9): undefined reference to `mandoc_ohash_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans0.ltrans.o: in function `tblcalc':
<artificial>:(.text+0x6ebf): undefined reference to `mandoc_calloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x719c): undefined reference to `mandoc_malloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x77c9): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8a89): undefined reference to `mandoc_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x91a5): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans0.ltrans.o: in function `pre_it':
<artificial>:(.text+0x9bbd): undefined reference to `mandoc_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans0.ltrans.o: in function `md_word.lto_priv.0':
<artificial>:(.text+0x9ef8): undefined reference to `mandoc_escape'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa216): undefined reference to `mchars_spec2cp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa247): undefined reference to `mchars_uc2str'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa2ac): undefined reference to `mchars_num2uc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa306): undefined reference to `mchars_num2char'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans0.ltrans.o: in function `pre_onearg':
<artificial>:(.text+0xba65): undefined reference to `roff_name'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans0.ltrans.o: in function `pre_fa':
<artificial>:(.text+0xbe5d): undefined reference to `mandoc_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans0.ltrans.o: in function `pre_fn':
<artificial>:(.text+0xc0d5): undefined reference to `mandoc_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc0fd): undefined reference to `mandoc_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans0.ltrans.o: in function `manpath_add.isra.0.lto_priv.0':
<artificial>:(.text+0xc33b): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc356): undefined reference to `mandoc_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans0.ltrans.o: in function `manconf_output':
<artificial>:(.text+0xc6a8): undefined reference to `strtonum'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc702): undefined reference to `strtonum'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc756): undefined reference to `mandoc_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc77d): undefined reference to `mandoc_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc7a4): undefined reference to `mandoc_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc7d8): undefined reference to `mandoc_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc808): undefined reference to `mandoc_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans0.ltrans.o:<artificial>:(.text+0xc847): more undefined references to `mandoc_strdup' follow
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans0.ltrans.o: in function `manconf_output':
<artificial>:(.text+0xc899): undefined reference to `mandoc_asprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans1.ltrans.o: in function `fs_lookup.isra.0':
<artificial>:(.text+0x14e): undefined reference to `mandoc_asprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1aa): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x246): undefined reference to `mandoc_asprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2b6): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x365): undefined reference to `mandoc_asprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3b0): undefined reference to `mandoc_asprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x432): undefined reference to `mandoc_asprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x48b): undefined reference to `mandoc_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans1.ltrans.o: in function `outdata_alloc':
<artificial>:(.text+0x520): undefined reference to `mandoc_calloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5a8): undefined reference to `mandoc_ohash_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans1.ltrans.o: in function `dba_new':
<artificial>:(.text+0x604): undefined reference to `mandoc_malloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x612): undefined reference to `mandoc_malloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x625): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x638): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x668): undefined reference to `mandoc_malloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x67d): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x693): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6e5): undefined reference to `mandoc_malloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6fb): undefined reference to `mandoc_ohash_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x724): undefined reference to `mandoc_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans1.ltrans.o: in function `parse':
<artificial>:(.text+0x7ac): undefined reference to `mparse_readfd'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7d8): undefined reference to `mandoc_xr_reset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7e1): undefined reference to `mparse_result'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x802): undefined reference to `mandoc_msg_getmin'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x84a): undefined reference to `ohash_first'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x872): undefined reference to `ohash_next'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x885): undefined reference to `ohash_delete'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x897): undefined reference to `mandoc_ohash_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8a2): undefined reference to `mandoc_msg_getrc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x920): undefined reference to `mandoc_xr_get'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa5b): undefined reference to `mandoc_asprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xaa3): undefined reference to `mandoc_asprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xb94): undefined reference to `mandoc_asprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xbdb): undefined reference to `mandoc_asprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xc30): undefined reference to `mandoc_asprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans1.ltrans.o:<artificial>:(.text+0xc79): more undefined references to `mandoc_asprintf' follow
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans1.ltrans.o: in function `parse':
<artificial>:(.text+0xd6b): undefined reference to `mandoc_msg'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xdc9): undefined reference to `mandoc_asprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xe15): undefined reference to `mandoc_asprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xec2): undefined reference to `mandoc_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xeea): undefined reference to `mandoc_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1131): undefined reference to `mandoc_asprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x143d): undefined reference to `mparse_copy'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1510): undefined reference to `mandoc_malloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x16ba): undefined reference to `mandoc_asprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x16dd): undefined reference to `mandoc_asprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1a21): undefined reference to `mandoc_msg'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1a74): undefined reference to `mandoc_asprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1bf5): undefined reference to `mandoc_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1d20): undefined reference to `mandoc_asprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1e85): undefined reference to `mandoc_asprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1f15): undefined reference to `mandoc_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1f53): undefined reference to `mandoc_asprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x1f73): undefined reference to `mandoc_asprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2008): undefined reference to `mandoc_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans1.ltrans.o: in function `dba_free':
<artificial>:(.text+0x25db): undefined reference to `ohash_first'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2658): undefined reference to `ohash_next'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2669): undefined reference to `ohash_delete'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans1.ltrans.o: in function `mlink_add.isra.0':
<artificial>:(.text+0x29de): undefined reference to `mandoc_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x29fb): undefined reference to `mandoc_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2a18): undefined reference to `mandoc_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2a35): undefined reference to `mandoc_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2a71): undefined reference to `ohash_qlookup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2a81): undefined reference to `ohash_find'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2a9b): undefined reference to `ohash_insert'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2abf): undefined reference to `ohash_lookup_memory'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2acf): undefined reference to `ohash_find'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2b07): undefined reference to `mandoc_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2b27): undefined reference to `mandoc_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2b64): undefined reference to `ohash_qlookup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2b74): undefined reference to `ohash_find'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2b8e): undefined reference to `ohash_insert'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2bb2): undefined reference to `ohash_lookup_memory'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2bc2): undefined reference to `ohash_find'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2bf7): undefined reference to `mandoc_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2c2f): undefined reference to `mandoc_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2c5c): undefined reference to `mandoc_calloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2c91): undefined reference to `ohash_insert'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans1.ltrans.o: in function `render_string':
<artificial>:(.text+0x334e): undefined reference to `mandoc_escape'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3378): undefined reference to `mchars_spec2str'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x33a5): undefined reference to `mandoc_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3663): undefined reference to `mandoc_malloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3692): undefined reference to `mchars_spec2cp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans1.ltrans.o: in function `putkeys':
<artificial>:(.text+0x3984): undefined reference to `ohash_qlookupi'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3992): undefined reference to `ohash_find'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3a6f): undefined reference to `mandoc_calloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3a94): undefined reference to `ohash_insert'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans1.ltrans.o: in function `parse_mdoc_Xr':
<artificial>:(.text+0x3cb7): undefined reference to `mandoc_asprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans1.ltrans.o: in function `parse_mdoc_Nd':
<artificial>:(.text+0x42ed): undefined reference to `deroff'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans1.ltrans.o: in function `parse_mdoc_Va':
<artificial>:(.text+0x434c): undefined reference to `deroff'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x43da): undefined reference to `deroff'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans1.ltrans.o: in function `parse_man':
<artificial>:(.text+0x4527): undefined reference to `deroff'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x46a5): undefined reference to `mandoc_strndup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans1.ltrans.o: in function `mlinks_undupe':
<artificial>:(.text+0x486e): undefined reference to `ohash_qlookup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x487b): undefined reference to `ohash_find'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4927): undefined reference to `ohash_qlookup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4934): undefined reference to `ohash_find'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans1.ltrans.o: in function `filescan':
<artificial>:(.text+0x4b8c): undefined reference to `mandoc_calloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans1.ltrans.o: in function `treescan':
<artificial>:(.text+0x50f4): undefined reference to `fts_open'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5125): undefined reference to `fts_read'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5186): undefined reference to `fts_read'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x519d): undefined reference to `fts_close'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x537d): undefined reference to `mandoc_calloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5630): undefined reference to `fts_set'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x56e9): undefined reference to `fts_set'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans1.ltrans.o: in function `dba_write':
<artificial>:(.text+0x7385): undefined reference to `ohash_entries'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7398): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x73ab): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x73bf): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x73d2): undefined reference to `ohash_first'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x75da): undefined reference to `ohash_next'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans1.ltrans.o: in function `dba_array_add':
<artificial>:(.text+0x8c90): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8caa): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8d1d): undefined reference to `mandoc_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans1.ltrans.o: in function `dbadd_mlink':
<artificial>:(.text+0x9859): undefined reference to `mandoc_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans1.ltrans.o: in function `dba_page_new':
<artificial>:(.text+0x9936): undefined reference to `mandoc_malloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x994b): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9961): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9988): undefined reference to `mandoc_malloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x999d): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x99b3): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x99e1): undefined reference to `mandoc_malloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x99f6): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9a0c): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9a5d): undefined reference to `mandoc_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9a73): undefined reference to `mandoc_malloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9a88): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9a9e): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9b04): undefined reference to `mandoc_malloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9b19): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9b2f): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9b6b): undefined reference to `mandoc_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9b81): undefined reference to `mandoc_malloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9b96): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9bac): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9c42): undefined reference to `mandoc_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans1.ltrans.o: in function `mpages_merge':
<artificial>:(.text+0x9cc1): undefined reference to `mandoc_ohash_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9cd6): undefined reference to `mandoc_ohash_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9ce4): undefined reference to `mparse_reset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9cf0): undefined reference to `mparse_open'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9d26): undefined reference to `mparse_readfd'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9d38): undefined reference to `mparse_result'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9d5c): undefined reference to `ohash_qlookup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9d69): undefined reference to `ohash_find'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9de7): undefined reference to `ohash_delete'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9df2): undefined reference to `ohash_delete'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9f23): undefined reference to `ohash_qlookupi'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9f33): undefined reference to `ohash_find'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9fbf): undefined reference to `ohash_qlookup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9fcc): undefined reference to `ohash_find'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa310): undefined reference to `ohash_first'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa5e1): undefined reference to `ohash_next'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa601): undefined reference to `ohash_first'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa6af): undefined reference to `ohash_qlookup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa6bd): undefined reference to `ohash_find'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa715): undefined reference to `ohash_next'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa789): undefined reference to `mandoc_malloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa7af): undefined reference to `mandoc_malloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa7c4): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa7d9): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa805): undefined reference to `ohash_insert'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa840): undefined reference to `ohash_qlookup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa84d): undefined reference to `ohash_find'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa8f9): undefined reference to `mandoc_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa928): undefined reference to `mandoc_calloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa950): undefined reference to `ohash_insert'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa972): undefined reference to `mandoc_asprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa982): undefined reference to `ohash_qlookup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa98f): undefined reference to `ohash_find'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xaa2c): undefined reference to `ohash_first'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xaa52): undefined reference to `ohash_next'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xaa6a): undefined reference to `ohash_first'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xaa92): undefined reference to `ohash_next'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xac0e): undefined reference to `mandoc_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xac27): undefined reference to `mandoc_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xac35): undefined reference to `mandoc_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xac79): undefined reference to `mandoc_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xad25): undefined reference to `mandoc_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans1.ltrans.o:<artificial>:(.text+0xad36): more undefined references to `mandoc_strdup' follow
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans1.ltrans.o: in function `mpages_merge':
<artificial>:(.text+0xae9b): undefined reference to `mandoc_strndup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xaf96): undefined reference to `mandoc_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xb100): undefined reference to `mandoc_strndup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans1.ltrans.o: in function `main':
<artificial>:(.text.startup+0x40): undefined reference to `setprogname'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x50): undefined reference to `mandoc_msg_setoutfile'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x161): undefined reference to `getprogname'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x61d): undefined reference to `mandoc_msg_setmin'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x653): undefined reference to `mandoc_msg_setmin'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x66b): undefined reference to `mandoc_msg_setmin'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x678): undefined reference to `mandoc_msg_setmin'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x685): undefined reference to `mandoc_msg_setmin'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans1.ltrans.o:<artificial>:(.text.startup+0x692): more undefined references to `mandoc_msg_setmin' follow
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans1.ltrans.o: in function `main':
<artificial>:(.text.startup+0x713): undefined reference to `mandoc_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x77d): undefined reference to `mandoc_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x927): undefined reference to `mchars_alloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x940): undefined reference to `mparse_alloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x9c0): undefined reference to `mparse_open'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x9dd): undefined reference to `mandoc_msg_setinfilename'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xb56): undefined reference to `mandoc_msg_setinfilename'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xc52): undefined reference to `mandoc_xr_free'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xc60): undefined reference to `mparse_free'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xc66): undefined reference to `mchars_free'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xcbf): undefined reference to `ohash_qlookup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xccc): undefined reference to `ohash_find'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xd15): undefined reference to `ohash_first'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xd51): undefined reference to `ohash_next'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xdd2): undefined reference to `ohash_first'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xdf0): undefined reference to `ohash_next'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xe03): undefined reference to `ohash_delete'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xe22): undefined reference to `mparse_reset'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xe5c): undefined reference to `mandoc_msg_getrc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xebc): undefined reference to `mandoc_msg'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xf76): undefined reference to `mandoc_msg_setrc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xff1): undefined reference to `mandoc_msg_setrc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0xffc): undefined reference to `mandoc_msg_getrc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1026): undefined reference to `ohash_delete'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1121): undefined reference to `mandoc_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x11ea): undefined reference to `mandoc_msg_setoutfile'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x11f5): undefined reference to `mandoc_msg_setmin'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x135d): undefined reference to `mandoc_msg_setrc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x15a4): undefined reference to `mandoc_msg_setinfilename'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x15c0): undefined reference to `mandoc_msg_setinfilename'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1614): undefined reference to `mandoc_msg_setrc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x168f): undefined reference to `mchars_alloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x169f): undefined reference to `mparse_alloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x16b6): undefined reference to `mandoc_ohash_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x16c8): undefined reference to `mandoc_ohash_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x16ff): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1732): undefined reference to `mandoc_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1820): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x183f): undefined reference to `mandoc_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1a8d): undefined reference to `mchars_alloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1a9d): undefined reference to `mparse_alloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1ab4): undefined reference to `mandoc_ohash_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1ac6): undefined reference to `mandoc_ohash_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1c34): undefined reference to `mparse_free'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1c3a): undefined reference to `mchars_free'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1c4a): undefined reference to `ohash_delete'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1c55): undefined reference to `ohash_delete'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1d45): undefined reference to `mandoc_ohash_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1d57): undefined reference to `mandoc_ohash_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1e52): undefined reference to `ohash_delete'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x1e5d): undefined reference to `ohash_delete'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x2880): undefined reference to `ohash_qlookup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x288f): undefined reference to `ohash_find'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x28d1): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x28eb): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x29c2): undefined reference to `mandoc_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x2a04): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x2a1e): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x2aea): undefined reference to `mandoc_malloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x2b29): undefined reference to `mandoc_malloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x2b49): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x2b63): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x2b9d): undefined reference to `ohash_insert'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x31d4): undefined reference to `ohash_qlookup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x31e1): undefined reference to `ohash_find'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text.startup+0x32e2): undefined reference to `arch_valid'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans2.ltrans.o: in function `term_tab_next':
<artificial>:(.text+0x196e): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans2.ltrans.o: in function `encode1.part.0':
<artificial>:(.text+0x1bf9): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans2.ltrans.o: in function `encode.part.0':
<artificial>:(.text+0x1dc1): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans2.ltrans.o: in function `encode1':
<artificial>:(.text+0x1f17): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans2.ltrans.o: in function `bufferc':
<artificial>:(.text+0x2161): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans2.ltrans.o:<artificial>:(.text+0x2213): more undefined references to `mandoc_reallocarray' follow
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans2.ltrans.o: in function `ps_printf':
<artificial>:(.text+0x2e4d): undefined reference to `mandoc_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans2.ltrans.o: in function `ps_plast.part.0':
<artificial>:(.text+0x333b): undefined reference to `mandoc_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x351e): undefined reference to `mandoc_realloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x3575): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans2.ltrans.o: in function `ps_begin':
<artificial>:(.text+0x40d6): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x4120): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans2.ltrans.o: in function `ps_closepage':
<artificial>:(.text+0x4416): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x446e): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans2.ltrans.o:<artificial>:(.text+0x44a6): more undefined references to `mandoc_reallocarray' follow
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans2.ltrans.o: in function `roff_term_pre_ft.lto_priv.0':
<artificial>:(.text+0x4fd2): undefined reference to `mandoc_font'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans2.ltrans.o: in function `termp_sy_pre.lto_priv.0':
<artificial>:(.text+0x5285): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans2.ltrans.o: in function `termp_em_pre.lto_priv.0':
<artificial>:(.text+0x5355): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans2.ltrans.o: in function `termp_li_pre.lto_priv.0':
<artificial>:(.text+0x5493): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans2.ltrans.o: in function `exprcomp.lto_priv.0':
<artificial>:(.text+0x56a4): undefined reference to `mandoc_calloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans2.ltrans.o: in function `exprterm':
<artificial>:(.text+0x57eb): undefined reference to `mandoc_calloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5a53): undefined reference to `mandoc_asprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5ab0): undefined reference to `mandoc_malloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5b43): undefined reference to `mandoc_malloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans2.ltrans.o: in function `expr_and':
<artificial>:(.text+0x5d5c): undefined reference to `mandoc_calloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans2.ltrans.o: in function `manmerge.lto_priv.0':
<artificial>:(.text+0x5ec2): undefined reference to `ohash_entries'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5ecd): undefined reference to `ohash_entries'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5ee0): undefined reference to `mandoc_malloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5ef3): undefined reference to `mandoc_ohash_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5f01): undefined reference to `ohash_first'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5f29): undefined reference to `ohash_lookup_memory'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5f37): undefined reference to `ohash_insert'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5f45): undefined reference to `ohash_next'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5f62): undefined reference to `ohash_lookup_memory'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5f6d): undefined reference to `ohash_find'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5f8a): undefined reference to `mandoc_malloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5f9d): undefined reference to `mandoc_ohash_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5fab): undefined reference to `ohash_first'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5fca): undefined reference to `ohash_first'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5ff0): undefined reference to `ohash_next'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6001): undefined reference to `ohash_delete'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6013): undefined reference to `ohash_delete'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x60f5): undefined reference to `ohash_lookup_memory'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6103): undefined reference to `ohash_find'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x63af): undefined reference to `mandoc_malloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x63c6): undefined reference to `ohash_insert'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x63d5): undefined reference to `ohash_delete'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6447): undefined reference to `ohash_first'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6473): undefined reference to `ohash_next'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6493): undefined reference to `ohash_lookup_memory'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x64a2): undefined reference to `ohash_find'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x64b7): undefined reference to `ohash_insert'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x64c7): undefined reference to `mandoc_malloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x64da): undefined reference to `mandoc_ohash_init'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans2.ltrans.o: in function `mansearch':
<artificial>:(.text+0x6c08): undefined reference to `ohash_first'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6d1f): undefined reference to `mandoc_asprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x6f97): undefined reference to `mandoc_malloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7227): undefined reference to `mandoc_malloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7309): undefined reference to `ohash_next'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x73df): undefined reference to `ohash_next'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x73f9): undefined reference to `ohash_delete'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x76f3): undefined reference to `mandoc_asprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7726): undefined reference to `mandoc_asprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x774d): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7846): undefined reference to `mandoc_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x79e2): undefined reference to `mandoc_malloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans2.ltrans.o: in function `term_tab_set':
<artificial>:(.text+0x7df7): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans2.ltrans.o: in function `pspdf_alloc.isra.0.lto_priv.0':
<artificial>:(.text+0x7ec9): undefined reference to `mandoc_calloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7edc): undefined reference to `mandoc_calloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7f26): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x7f50): undefined reference to `mandoc_calloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans2.ltrans.o: in function `ascii_init.isra.0.lto_priv.0':
<artificial>:(.text+0x83c6): undefined reference to `mandoc_calloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x83d9): undefined reference to `mandoc_calloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8426): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans2.ltrans.o: in function `term_strlen':
<artificial>:(.text+0x86e5): undefined reference to `mandoc_escape'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x87f2): undefined reference to `mandoc_escape'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8885): undefined reference to `mchars_num2uc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x88eb): undefined reference to `mchars_num2char'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8952): undefined reference to `mchars_spec2str'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x89aa): undefined reference to `mchars_spec2cp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x89bf): undefined reference to `mchars_uc2str'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans2.ltrans.o: in function `term_word':
<artificial>:(.text+0x8c6a): undefined reference to `mandoc_escape'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8d4f): undefined reference to `mchars_num2uc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8e47): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8ea0): undefined reference to `mchars_spec2str'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8eec): undefined reference to `mchars_num2char'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x8ff7): undefined reference to `mandoc_escape'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9431): undefined reference to `mchars_spec2cp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9446): undefined reference to `mchars_uc2str'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9c41): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9c98): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9cd3): undefined reference to `mchars_uc2str'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9d52): undefined reference to `mandoc_escape'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9d83): undefined reference to `mchars_spec2cp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9dbd): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9e06): undefined reference to `mchars_num2uc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9e41): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x9f5a): undefined reference to `mchars_num2char'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans2.ltrans.o: in function `termp__t_pre.lto_priv.0':
<artificial>:(.text+0xa122): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans2.ltrans.o: in function `termp_lk_pre.lto_priv.0':
<artificial>:(.text+0xa6fb): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xa729): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans2.ltrans.o: in function `termp_in_post.lto_priv.0':
<artificial>:(.text+0xab83): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans2.ltrans.o: in function `termp_fa_pre.lto_priv.0':
<artificial>:(.text+0xac93): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans2.ltrans.o:<artificial>:(.text+0xad15): more undefined references to `mandoc_reallocarray' follow
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans2.ltrans.o: in function `term_tbl':
<artificial>:(.text+0xceed): undefined reference to `mandoc_recallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd22a): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd786): undefined reference to `mandoc_recallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xd849): undefined reference to `mandoc_recallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans2.ltrans.o: in function `termp_fo_pre.lto_priv.0':
<artificial>:(.text+0xed28): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans2.ltrans.o: in function `termp_in_pre.lto_priv.0':
<artificial>:(.text+0xeffe): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xf165): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans2.ltrans.o: in function `termp_cd_pre.lto_priv.0':
<artificial>:(.text+0xf2b2): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans2.ltrans.o: in function `termp_ss_pre.lto_priv.0':
<artificial>:(.text+0xf59b): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans2.ltrans.o:<artificial>:(.text+0xf943): more undefined references to `mandoc_reallocarray' follow
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans3.ltrans.o: in function `print_man_head':
<artificial>:(.text+0x22e8): undefined reference to `mandoc_asprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x251b): undefined reference to `mandoc_asprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans3.ltrans.o: in function `print_mdoc_head.lto_priv.1':
<artificial>:(.text+0x2758): undefined reference to `mandoc_asprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2789): undefined reference to `mandoc_asprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x28a6): undefined reference to `mandoc_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x29c5): undefined reference to `mandoc_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x29f9): undefined reference to `mandoc_asprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans3.ltrans.o: in function `print_man_foot':
<artificial>:(.text+0x2aa3): undefined reference to `mandoc_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x2cee): undefined reference to `mandoc_asprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans3.ltrans.o: in function `eqn_box.lto_priv.1':
<artificial>:(.text+0x45d3): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans3.ltrans.o: in function `roff_html_pre_ft':
<artificial>:(.text+0x5073): undefined reference to `mandoc_font'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans3.ltrans.o: in function `html_make_id.part.0':
<artificial>:(.text+0x50ad): undefined reference to `deroff'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5142): undefined reference to `ohash_qlookup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5152): undefined reference to `ohash_find'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x519e): undefined reference to `mandoc_asprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x51ad): undefined reference to `ohash_qlookup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x51bd): undefined reference to `ohash_find'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x51e8): undefined reference to `mandoc_asprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x51f7): undefined reference to `ohash_qlookup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5207): undefined reference to `ohash_find'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5238): undefined reference to `mandoc_asprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5247): undefined reference to `ohash_qlookup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5257): undefined reference to `ohash_find'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x5282): undefined reference to `ohash_insert'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans3.ltrans.o: in function `termp_vt_pre':
<artificial>:(.text+0x544b): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x54ed): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans3.ltrans.o: in function `termp_nm_pre':
<artificial>:(.text+0x5705): undefined reference to `mandoc_reallocarray'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans3.ltrans.o: in function `print_otag':
<artificial>:(.text+0x79be): undefined reference to `mandoc_malloc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0x847e): undefined reference to `mandoc_asprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans3.ltrans.o: in function `mdoc_sx_pre':
<artificial>:(.text+0x9f50): undefined reference to `deroff'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans3.ltrans.o: in function `print_encode':
<artificial>:(.text+0xb1a6): undefined reference to `mandoc_escape'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xb633): undefined reference to `mchars_num2char'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xb65f): undefined reference to `mchars_spec2cp'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xb6ae): undefined reference to `mchars_num2uc'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans3.ltrans.o: in function `mdoc_mt_pre':
<artificial>:(.text+0xca4f): undefined reference to `mandoc_asprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans3.ltrans.o: in function `mdoc_fd_pre':
<artificial>:(.text+0xcfed): undefined reference to `mandoc_strdup'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans3.ltrans.o: in function `mdoc_sh_pre':
<artificial>:(.text+0xe12a): undefined reference to `deroff'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: <artificial>:(.text+0xe2f8): undefined reference to `deroff'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans3.ltrans.o: in function `man_UR_pre':
<artificial>:(.text+0xec31): undefined reference to `mandoc_asprintf'
/toolchain/lib/gcc/x86_64-pc-linux-musl/9.2.0/../../../../x86_64-pc-linux-musl/bin/ld: /tmp/mandoc.aDKEPp.ltrans4.ltrans.o: in function `eqn_box.lto_priv.0':
<artificial>:(.text+0x12cc): undefined reference to `mandoc_escape'
collect2: error: ld returned 1 exit status
make: *** [Makefile:518: mandoc] Error 1
```
