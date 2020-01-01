#!/usr/bin/dash -e

# Copyright (c) 2019-2020, Firas Khalil Khana
# Distributed under the terms of the ISC License

PATH=/usr/bin
CERD=/home/glaucus/cerata

if [ ! -d $CERD/$1 ]; then
  cd $CERD/$1

  cat > ceras << EOF
# Copyright (c) 2019-2020, Firas Khalil Khana
# Distributed under the terms of the ISC License

# Voyager: Firas Khalil Khana (firasuke) <firasuke@glaucuslinux.org>

nom=$1
ver=$2
url=$3
lic=
EOF
  
  cat > system.ceras << 'EOF'
# Copyright (c) 2019-2020, Firas Khalil Khana
# Distributed under the terms of the ISC License

# Voyager: Firas Khalil Khana (firasuke) <firasuke@glaucuslinux.org>

prepare_system() {
  $RSYNC $CERD/$nom/$nom-$ver/ $SSRC/$nom --delete
  cd $SSRC/$nom
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
    DESTDIR=$SCER/$nom/sac \
    install-strip
}
EOF

  install -dv /home/glaucus/sources/$1
  cd /home/glaucus/sources/$1

  case $2 in
    git)
      case $4 in
        yes) torify git clone $3 . ;;
        no) git clone $3 . ;;
      esac
      ;;
    *)
      case $4 in
        yes) torify wget $3 ;;
        no) wget $3 ;;
      esac

      sed "/^url=.*/a sum=$(echo $(sha512sum $(basename $3)) | awk \
        '{print $1}')" -i $CERD/$1/ceras
      ;;
  esac
else
  echo ceras $1 already exists!
fi
