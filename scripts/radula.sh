#!/bin/dash -ex

mkdir /home/glaucus/cerata/$1

cat > /home/glaucus/cerata/$1/ceras << EOF
name=$1
version=$2
release=1
description=''
arch=x86_64
url=$3
license=
EOF

case $2 in
	git)
		git clone $3 /home/glaucus/cerata/$1/$1
		;;
	*)
		wget $3 -P /home/glaucus/cerata/$1
cat >> /home/glaucus/cerata/$1/ceras << EOF
checksum=$(echo $(sha512sum /home/glaucus/cerata/$1/$(basename $3)) | awk '{print $1}')
EOF
		;;
esac

cat >> /home/glaucus/cerata/$1/ceras << EOF

build () {
	:
}
EOF
