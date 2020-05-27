# pcre2
## System
### Configure
`--enable-pcre2grep-libbz2` doesn't work with `lbzip2` as it doesn't provide
`bzlib.h`, and we won't be adding full `bzip2` just to satisfy a single ceras.
