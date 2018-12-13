#!/bin/dash -ex
. /home/glaucus/scripts/variables
. /home/glaucus/scripts/system/clean.sh
assign_basic_variables
assign_system_variables
cd $GLAD
mkdir -p bin boot dev etc lib proc sys tmp var/run
install -d -m 0750 $GLAD/root
cp $PRFX/$TRPL/lib64/libgcc_s.so.1 $GLAD/lib
cp $PRFX/$TRPL/lib64/libstdc++.so.6.0.25 $GLAD/lib
cd $GLAD/lib
ln -sfv libstdc++.so.6.0.25 libstdc++.so.6
$STRIP libgcc_s.so.1 libstdc++.so.6.0.25
