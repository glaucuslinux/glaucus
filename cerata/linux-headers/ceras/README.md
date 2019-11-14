# linux-headers

## Native

### Prepare
Yes we're going into the original upstream cerata repo for Linux, but we're
not going to modify anything, and it won't hurt to run `make mrproper` to be
safe just in case.

We then utilize the `O` option to point it to the out of tree (remote) build
path (we're not building anything though, just checking and then installing)

`headers_check` is disabled (to speed the built time a bit as it sanitizes
headers)

### Install
this only works if linux was first (in construct) as this command will erase
all previously installed headers (including musl's headers) in the
INSTALL_HDR_PATH destination which would then require manually copying the
header files to their destination

this also requires rsync as of 5.3.x, if rsync isn't installed then replace
`headers_install` with `headers` then remove `INSTALL_HDR_PATH=$TOOL` and
manually copy the headers in `$NBLD/$name/usr/include` to `$TOOL/include`.

Removes unnecessary files that take about 200KB of precious disk space
