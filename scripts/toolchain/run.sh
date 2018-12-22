#!/usr/bin/dash -ex
. /home/glaucus/scripts/update.sh
count=1
while true; do
        file=$count
        if [ -d "/home/glaucus/logs/toolchain/$file" ]; then
                count=$(($count + 1))
        else
                break
        fi
done
mkdir /home/glaucus/logs/toolchain/$file
(dash /home/glaucus/scripts/toolchain/construct.sh | tee /home/glaucus/logs/toolchain/$file/stdout.log) 3>&1 1>&2 2>&3 | tee /home/glaucus/logs/toolchain/$file/stderr.log
