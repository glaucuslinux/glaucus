# Chroot Scripts

## Variables
the main toolchain symbolic link

the sources directory is just an rsync of the packages that need some
sort of source modification

The basic vars, needed for LTO

Optimization hell, proceed with caution!
You have been warned!

All performance related flags listed on the internet that are still
relevant are being used here, and compiling the entire system from 
source when all of them are enabled without actually testing them
individually will most likely result in a bloated system with big 
(and most likely slow) binaries

Again they are all listed in alphabetical order

First we have Global Common Subexpression Elimination

Then we have Graphite and ISL for loop optimization

The regular march flag, change to `x86-64` if you want to help
maintain a certain ceras for a number of users, else leave it at 
`native` if you're only going to use the resulting cerata on your system

Extra performance related flags

The purpose of PGO is to check whether it's beneficial or not to 
enable these 2 flags. The current method enables both of them for all
packages without checking if it's beneficial or not

Enables Swing Modulo Scheduling

Your regular flags, ordered by the order in which they appear in 
`man gcc`, the gcc `configure` file and the following link 
https://gcc.gnu.org/install/configure.html

Additional optimizations are listed in the flags below without 
defining them as variables these include pipe, OpenMP, the dangerous 
Ofast, IRA and IPA.

Changing Ofast to O3, O2 or even Os is highly recommended after 
testing the results.

A benchmarking method should be picked to evaluate the performance,
size and latencies of the resulting cerata

Additional flavors were added, one without LTO and one without OpenMP
since some packages have troubles with these two enabled

Everything is stripped and all symbols are being removed

Notice how LDFLAGS uses CFLAGS as well since we have LTO enabled
