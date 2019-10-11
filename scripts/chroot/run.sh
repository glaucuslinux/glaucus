#!/usr/bin/dash -ex

# Copyright (c) 2019, Firas Khalil Khana
# Distributed under the terms of the ISC License

export ARCH=x86_64
export TUPL=$ARCH-pc-linux-musl
export GLAD=/home/glaucus
export CERD=$GLAD/cerata
export MAKEFLAGS=-j1

# glaucus' chroot directory
export GLCD=$GLAD/chroot

# the main toolchain symbolic link
export TOOL=/toolchain
export PATH=$TOOL/bin:/usr/bin

# the sources directory is just an rsync of the packages that need some
# sort of source modification
export CLOG=$GLAD/logs/chroot
export CSCR=$GLAD/scripts/chroot
export CTMP=$GLAD/temporary/chroot
export CBLD=$CTMP/builds
export CSRC=$CTMP/sources

# Variables pointing to executables are sorted alphabetically
# Also, notice how AR, NM and RANLIB are using LTO
# The resulting mawk is used since it's faster and more minimal

# The basic four all pointing to the sysroot GLCD
# the sysroot here should be honored and should remove the need for
# explicitly specifying sysroot whenever compiling a package



# The resulting byacc is being used as it's lighter and more minimal
# yacc is just a symlink to byacc intended for compatibility purposes

# Optimization hell, proceed with caution!
# You have been warned!

# All performance related flags listed on the internet that are still
# relevant are being used here, and compiling the entire system from 
# source when all of them are enabled without actually testing them
# individually will most likely result in a bloated system with big 
# (and most likely slow) binaries

# Again they are all listed in alphabetical order

# First we have Global Common Subexpression Elimination
export GCSE='-fgcse-sm -fgcse-las'

# Then we have Graphite and ISL for loop optimization
export GRAPHITE='-fgraphite-identity -floop-nest-optimize -floop-parallelize-all'

# The regular march flag, change to `x86-64` if you want to help
# maintain a certain ceras for a number of users, else leave it at 
# `native` if you're only going to use the resulting cerata on your system
export MARCH='-march=x86-64'

# Extra performance related flags
export OTHER='-fmerge-all-constants -fdevirtualize-at-ltrans -fvariable-expansion-in-unroller'

# The purpose of PGO is to check whether it's beneficial or not to 
# enable these 2 flags. The current method enables both of them for all
# packages without checking if it's beneficial or not
export PGO='-ftracer -funroll-loops'

# Enables Swing Modulo Scheduling
export SMS='-fmodulo-sched -fmodulo-sched-allow-regmoves'

# Your regular flags, ordered by the order in which they appear in 
# `man gcc`, the gcc `configure` file and the following link 
# https://gcc.gnu.org/install/configure.html

# Additional optimizations are listed in the flags below without 
# defining them as variables these include pipe, OpenMP, the dangerous 
# Ofast, IRA and IPA.

# Changing Ofast to O3, O2 or even Os is highly recommended after 
# testing the results.

# A benchmarking method should be picked to evaluate the performance,
# size and latencies of the resulting cerata

# Additional flavors were added, one without LTO and one without OpenMP
# since some packages have troubles with these two enabled

# Everything is stripped and all symbols are being removed

# Notice how LDFLAGS uses CFLAGS as well since we have LTO enabled
#export CFLAGS="-pipe -fopenmp -g0 -Ofast $SMS $GCSE -fira-loop-pressure -fipa-pta $GRAPHITE $OTHER -flto $PGO -s $MARCH"
#export CFLAGSNOLTO="-pipe -fopenmp -g0 -Ofast $SMS $GCSE -fira-loop-pressure -fipa-pta $GRAPHITE $OTHER $PGO -s $MARCH"
#export CFLAGSNOOPENMP="-pipe -g0 -Ofast $SMS $GCSE -fira-loop-pressure -fipa-pta $GRAPHITE $OTHER -flto $PGO -s $MARCH"
export CFLAGS="-pipe -fopenmp -g0 -Ofast $SMS $GCSE -fira-loop-pressure -fipa-pta $GRAPHITE $OTHER -flto $PGO -s $MARCH"
export CFLAGSNOLTO="-pipe -fopenmp -g0 -Ofast $SMS $GCSE -fira-loop-pressure -fipa-pta $GRAPHITE $OTHER $PGO -s $MARCH"
export CFLAGSNOOPENMP="-pipe -g0 -Ofast $SMS $GCSE -fira-loop-pressure -fipa-pta $GRAPHITE $OTHER -flto $PGO -s $MARCH"
#export CPPFLAGS=-I$GLCD/include
export CXXFLAGS="$CFLAGS"
export LDFLAGS="-Wl,--strip-all -Wl,--as-needed $CFLAGS"

rm -frv $CBLD && install -dv $CBLD
rsync -vah $TOOL/ $GLCD --delete

count=1
while true; do
  log=$count
  if [ -d $CLOG/$log ]; then count=$(($count + 1)); else break; fi
done
install -dv $CLOG/$log

(. $CSCR/build | tee $CLOG/$log/out.log) 3>&1 1>&2 2>&3 | tee \
  $CLOG/$log/err.log
