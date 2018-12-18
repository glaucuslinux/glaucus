#!/bin/dash -ex
. /home/glaucus/scripts/variables
. /home/glaucus/scripts/system/clean.sh
assign_basic_variables
assign_system_variables
cd $GLAD
mkdir -pv bin boot dev etc lib proc sys tmp run
install -dvm 0750 $GLAD/root
rsync -vah $PRFX/$TRPL/lib64/libgcc_s.so.1 $GLAD/lib --delete
rsync -vah $PRFX/$TRPL/lib64/libstdc++.so.6.0.25 $GLAD/lib --delete
cd $GLAD/lib
ln -fsv libstdc++.so.6.0.25 libstdc++.so.6
$STRIP libgcc_s.so.1 libstdc++.so.6.0.25
