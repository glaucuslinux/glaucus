#!/bin/dash -ex
cd $GLAD
install -dv bin boot dev etc include lib proc run share/cerata sys tmp
install -dvm 0750 root
install -v $TOOL/$TRPL/lib64/libgcc_s.so.1 lib
install -v $TOOL/$TRPL/lib64/libstdc++.so.6.0.25 lib
cd $GLAD/lib
$STRIP libgcc_s.so.1 libstdc++.so.6.0.25
ln -fsv libstdc++.so.6.0.25 libstdc++.so.6
