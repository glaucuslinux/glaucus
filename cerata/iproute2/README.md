# iproute2

## Name
iproute2

## Version
git

## Release
1

## Architecture
* x86-64

## URL
https://git.kernel.org/pub/scm/network/iproute2/iproute2

## Cyst
* musl

## Description
A collection of utilities for controlling TCP/IP networking and traffic in Linux

## License
* GPLv2+

## Prepare
```shell
rsync -vah $CERD/$name/$name $SSRC --delete
cd $SSRC/$name
```

```shell
rm -frv include/ip6tables.h include/iptables include/iptables.h \
  include/libiptc include/netinet man/man8/arpd.8
```

## Configure
```shell
sed -e '/ARPD/d' \
  -e "s/CC := gcc/CC = $TUPL-gcc --sysroot=\/home\/glaucus\/system/"  \
  -e "s/HOSTCC ?= .*/HOSTCC = $TUPL-gcc --sysroot=\/home\/glaucus\/system/"  \
  -e "s/CCOPTS = -O2/CCOPTS = $CFLAGS/" \
  -e 's/SUBDIRS=.*/SUBDIRS=lib ip/' \
  -e '/genl/d' \
  -i Makefile
```

```shell
sed 's/TCPI_OPT_ECN_SEEN/16/' \
  -i misc/ss.c
```

```shell
sed 's/.m_ipt.o//' \
  -i tc/Makefile
```

```shell
./configure
```

```shell
sed -e '/IPSET/i TC_CONFIG_NO_XT:=y' \
  -e 's/TC_CONFIG_IPSET:=y/TC_CONFIG_IPSET:=n/g' \
  -e '/IPSET/{n;d}' \
  -e 's/IP_CONFIG_SETNS:=y/IP_CONFIG_SETNS:=n/g' \
  -e 's/HAVE_ELF:=y/HAVE_ELF:=n/g' \
  -e '/HAVE_ELF/{n;N;d}' \
  -e 's/HAVE_MNL:=y/HAVE_MNL:=n/g' \
  -e '/HAVE_MNL/{n;N;d}' \
  -e 's/HAVE_CAP:=y/HAVE_CAP:=n/g' \
  -e '/HAVE_CAP/{n;N;d}' \
  -i config.mk
```

## Build
```shell
make
```

## Install
```shell
install -Dv ip/ip $SCER/$name/sac/usr/bin/ip
install -Dv man/man8/ip.8 $SCER/$name/sac/usr/share/man/man8/ip.8
```
