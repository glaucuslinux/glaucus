#!/bin/dash -ex
cd $GLAD
mkdir -pv bin boot dev etc include lib proc run share/cerata sys tmp
install -dvm 0750 $GLAD/root
rsync -vah $TOOL/$TRPL/lib64/libgcc_s.so.1 $GLAD/lib --delete
rsync -vah $TOOL/$TRPL/lib64/libstdc++.so.6.0.25 $GLAD/lib --delete
cd $GLAD/lib
ln -fsv libstdc++.so.6.0.25 libstdc++.so.6
$STRIP libgcc_s.so.1 libstdc++.so.6.0.25
