#!/usr/bin/dash -ex
. /home/glaucus/scripts/variables
assign_basic_variables
export PATH=$PATH:/usr/bin/core_perl
assign_toolchain_variables
. /home/glaucus/scripts/toolchain/clean.sh
count=1
while true
do
        file=$count
        if [ -d $TLOG/$file ]
        then
                count=$(($count + 1))
        else
                break
        fi
done
mkdir -v $TLOG/$file
(dash /home/glaucus/scripts/toolchain/construct.sh | tee $TLOG/$file/stdout.log) 3>&1 1>&2 2>&3 | tee $TLOG/$file/stderr.log
