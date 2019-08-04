#!/usr/bin/dash -ex
mkdir -v /home/glaucus/cerata/$1
cat > /home/glaucus/cerata/$1/ceras << EOF
name=$1
version=$2
release=1
arch=x86_64
url=$3
cysts=
description=''
license=
EOF
case $2 in
        git)
                torify git clone $3 /home/glaucus/cerata/$1/$1
                ;;
        svn)
                torify svn co $3 /home/glaucus/cerata/$1/$1
                ;;
        *)
                torify curl $3 -o /home/glaucus/cerata/$1
cat >> /home/glaucus/cerata/$1/ceras << EOF
checksum=$(echo $(sha512sum /home/glaucus/cerata/$1/$(basename $3)) | awk '{print $1}')
EOF
                ;;
esac
cat >> /home/glaucus/cerata/$1/ceras << 'EOF'
build(){
        rsync -vah $CERD/$name/$name $SSRC --delete
        cd $SSRC/$name
        ./configure \
                --prefix=/usr \
                --build=$TUPL \
                --host=$TUPL \
                --target=$TUPL
        make
        make DESTDIR=$SCER/$name/sac \
                install-strip
}
EOF
