#!/usr/bin/dash -ex
mkdir -v /home/glaucus/cerata/$1
cd /home/glaucus/cerata/$1
cat > ceras << EOF
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
                case $4 in
                        yes) torify git clone $3 ;;
                        no) git clone $3 ;;
                esac
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
                        yes) torify curl $3 -o $(basename $3) ;;
                        no) curl $3 -o $(basename $3) ;;
                esac
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
