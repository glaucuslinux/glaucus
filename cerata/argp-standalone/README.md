# argp-standalone

## Name
argp-standalone

## Version
1.4-test2

## Release
1

## Supported Architectures
* x86-64

## URL
http://www.lysator.liu.se/~nisse/misc/argp-standalone-1.4-test2.tar.gz

## Cyst
* musl

## Description
Standalone version of arguments parsing functions from GLIBC for use with musl

## Licenses
* GPLv2+
* GPLv3+
* PD
* XC

## Prepare
* patch
* sed

## Configure
* prefix=/usr
* build=$TUPL
* host=$TUPL
* target=$TUPL

## Build
* make

## Install
* DESTDIR=$SCER/$name/sac
* install-strip
