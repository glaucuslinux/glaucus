# bzip2

## Chroot
even though the version number is 1.0.8, it insists on installing its shared
library as 1.0.6

### Build
bzip2 takes openmp so for it to work we need to define LD_LIBRARY_PATH and set
it to $TOOL/lib to prevent it from using /lib/libgomp.so

If you don't plan on using openmp with bzip2, then remove the LD_LIBRARY_PATH
from chroot.ceras
