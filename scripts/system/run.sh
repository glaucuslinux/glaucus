#!/usr/bin/dash -ex
. /home/glaucus/scripts/system/clean.sh
case $1 in
        upgrade) . /home/glaucus/scripts/update.sh ;;
esac
. /home/glaucus/scripts/variables
assign_basic_variables
assign_system_variables
. /home/glaucus/scripts/system/prepare.sh
count=1
while true
do
        file=$count
        if [ -d $SLOG/$file ]
        then
                count=$(($count + 1))
        else
                break
        fi
done
mkdir -v $SLOG/$file
(dash /home/glaucus/scripts/system/construct.sh | tee $SLOG/$file/stdout.log) 3>&1 1>&2 2>&3 | tee $SLOG/$file/stderr.log
#. /home/glaucus/scripts/system/configure.sh
#sudo dash /home/glaucus/scripts/system/img.sh
