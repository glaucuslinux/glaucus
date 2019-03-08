#!/bin/dash -ex
cd $GLAD
install -dv bin boot dev etc include lib proc run share/cerata sys var var/lib var/lib/urandom var/log
install -dvm 0750 root
install -v $TOOL/$TUPL/lib64/libgcc_s.so.1 lib
install -v $TOOL/$TUPL/lib64/libstdc++.so.6.0.26 lib
cd $GLAD/lib
$STRIP libgcc_s.so.1 libstdc++.so.6.0.26
ln -fsv libstdc++.so.6.0.26 libstdc++.so.6
