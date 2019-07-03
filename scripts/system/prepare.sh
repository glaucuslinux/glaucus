#!/usr/bin/dash -ex
cd $GLAD
install -dv boot dev etc proc run sys usr/bin usr/cerata usr/include usr/lib usr/share var var/lib var/lib/urandom var/log
install -dvm 0750 root
install -v $TOOL/$TUPL/lib64/libgcc_s.so.1 usr/lib
install -v $TOOL/$TUPL/lib64/libstdc++.so.6.0.26 usr/lib
cd $GLAD/usr/lib
$STRIP libgcc_s.so.1 libstdc++.so.6.0.26
ln -fsv libstdc++.so.6.0.26 libstdc++.so.6
