# Toolchain Scripts

## Variables
Although ARCH should be x86-64, some packages won't build successfully
without x86_64, so the main approach is to use x86-64 whenever possible
and switch to x86_64 once an error occurs

Decided to go with quadruplets for tuples,
Replaced unknown with pc because it's shorter and more expressive

glaucus directory

glaucus toolchain

cerata is for storing upstream sources and glaucus' recipe format
logs contains log files for both System and Toolchain
scripts contains all scripts
temporary is where all the magic happens ;)

Where the sources reside away from upstream repo clones

The system wide symlink to the toolchain

$CRSS should be searched first
`/usr/bin/core_perl` resolves the pod2man related error until perl is added

It's highly recommended that MAKEFLAGS value stays at -j1 for now as any
higher value might cause weird problems (segfaults included). 

## Prepare
Prepare for building

to ensure the sanity of the toolchain on x86-64 hosts before installation

## Run
Build both cross and native (comment native to disable building it)
