#!/bin/dash -ex
construct(){
        for item in $@
        do
                if grep -q cyst $CERD/$item/ceras
                then
                        . $CERD/$item/ceras
                        temp="$temp $cyst$cysts $item"
                else
                        temp="$temp $item"
                fi
        done
        for item in $temp
        do
                if [ ! -d $SCER/$item/sac ]
                then
                        . $CERD/$item/ceras
                        mkdir -pv $SCER/$name/sac
                        build
                        envenomate
                fi
        done
}
envenomate(){
        mkdir -v $SCER/$name/venom
        cd $SCER/$name/sac
        sha512sum $(tar cJvf ../venom/$name-$version-$release-$arch.tar.xz * | sed '/\/$/d' | sort) > ../venom/$name-$version-$release-$arch.checksum
        tar xvf $SCER/$name/venom/$name-$version-$release-$arch.tar.xz -C $GLAD
        rsync -vah $SCER/$name/venom $GLAD/share/cerata/$name --delete
}
#construct musl \
        #mawk byacc mawk re2c \
        #sbase ubase lobase
        #sdhcp \
        #dash loksh \
        #libarchive \
        #less mandoc vim \
        #e2fsprogs iproute2 file opendoas libressl \
        #linux lilo \
        #s6 s6-linux-init s6-rc
#construct sinit smdev svc
#construct musl opendoas
construct svc #sbase ubase lobase sdhcp sinit smdev svc 
