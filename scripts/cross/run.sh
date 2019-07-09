#!/usr/bin/dash -ex
. /home/glaucus/scripts/variables
assign_basic_variables
assign_cross_variables
. /home/glaucus/scripts/cross/clean.sh
count=1
while true
do
        file=$count
        if [ -d $CLOG/$file ]
        then
                count=$(($count + 1))
        else
                break
        fi
done
mkdir -v $CLOG/$file
(dash /home/glaucus/scripts/cross/construct.sh | tee $CLOG/$file/stdout.log) 3>&1 1>&2 2>&3 | tee $CLOG/$file/stderr.log
