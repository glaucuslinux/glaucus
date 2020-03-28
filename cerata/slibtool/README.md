# slibtool
While `slibtool` is a nice lightweight alternative to `libtool` it still isn't
quite a complete one.

There is no `slibtoolize` provided by the lead developer and we'll have to rely
on versions provided by either Libertine or Ataraxia Linux (which work) but as I
said it didn't feel as a whole like a viable alternative since we still have
to rely on many parts from `libtool` (like the macros and `ltmain.sh`) and parts
from `automake` like the auxiliary build tools (`depcomp`, `missing`...).

Maybe in the future when `slibtool`, `sltdl` and `slibtoolize` are viable enough
I'll reconsider them, but for now I'll stick to libtool.
