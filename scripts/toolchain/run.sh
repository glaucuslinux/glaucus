#!/usr/bin/dash -ex
. /home/glaucus/scripts/toolchain/clean.sh
case $1 in
        upgrade) . /home/glaucus/scripts/update.sh ;;
esac
. /home/glaucus/scripts/variables
assign_basic_variables
assign_toolchain_variables
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
