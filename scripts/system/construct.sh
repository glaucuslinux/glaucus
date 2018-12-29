#!/bin/dash -ex
construct(){
        for item in $@
        do
                if [ -d $CERD/$item ]
                then
                                if grep -q cysts $CERD/$item/ceras
                                then
                                        . $CERD/$item/ceras
                                        temp="$temp $cysts $item"
                                else
                                        temp="$temp $item"
                                fi
                else
                        echo "$item isn't a valid ceras."
                        exit 1
                fi
        done
        for item in $temp
        do
                if [ ! -d $SCER/$item/sac ]
                then
                        . $CERD/$item/ceras
                        mkdir -pv $SCER/$name/sac
                        mkdir -pv $SCER/$name/venom
                        build
                else
                        echo $item is already installed.
                        #exit 1
                fi
        done
}
envenomate(){
        cd $SCER/$name/sac
        sha512sum $(tar cJvf ../venom/$name-$version-$release-$arch.tar.xz * | sed '/\/$/d') > ../venom/checksum
}
construct musl
construct mawk byacc mawk re2c
#construct sbase ubase lobase
#construct sinit smdev svc
#construct sdhcp
#construct dash
#construct zlib xz libarchive
construct loksh less mandoc vim
#construct e2fsprogs iproute2 file opendoas libressl
#construct linux lilo
#construct s6 s6-linux-init s6-rc
