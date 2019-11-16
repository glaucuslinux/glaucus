#!/usr/bin/dash -ex

# Copyright (c) 2019, Firas Khalil Khana
# Distributed under the terms of the ISC License

CERD=/home/glaucus/cerata

if [ ! -d $CERD/$1 ]; then
  install -dv $CERD/$1/ceras
  cd $CERD/$1/ceras

  cat > ceras << EOF
# Copyright (c) 2019, Firas Khalil Khana
# Distributed under the terms of the ISC License

# Voyager: Firas Khalil Khana (firasuke) <firasuke@gmail.com>

name=$1
version=$2
release=1
arch=x86_64
url=$3
cyst=musl
description=''
license=
EOF
  
  cat > system.ceras << 'EOF'
# Copyright (c) 2019, Firas Khalil Khana
# Distributed under the terms of the ISC License

# Voyager: Firas Khalil Khana (firasuke) <firasuke@gmail.com>

prepare_system() {
  rsync -vah $CERD/$name/$name $SSRC --delete
  cd $SSRC/$name
}

configure_system() {
  ./configure \
    --prefix=/usr
}

build_system() {
  make
}

install_system() {
  make \
    DESTDIR=$SCER/$name/sac \
    install-strip
}
EOF

  cat > ../README.md << EOF
# $1

## Name
$1

## Version
$2

## Release
1

## Architecture
x86-64

## URL
$3

## Cyst
* musl

## Description

## License

EOF

  cd $CERD/$1
  case $2 in
    git)
      case $4 in
        yes) torify git clone $3 ;;
        no) git clone $3 ;;
      esac
      git submodule add $3
      ;;
    hg)
      case $4 in
        yes) torify hg clone $3 ;;
        no) hg clone $3 ;;
      esac
      ;;
    svn)
      case $4 in
        yes) torify svn co $3 ;;
        no) svn co $3 ;;
      esac
      ;;
    *)
      case $4 in
        yes) torify wget $3 ;;
        no) wget $3 ;;
      esac

      sed "/^url=.*/a checksum=$(echo $(sha512sum $(basename $3)) | awk \
        '{print $1}')" -i ceras/ceras
      ;;
  esac
else
  echo ceras $1 already exists!
fi
