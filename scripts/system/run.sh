#!/usr/bin/dash -ex
count=1
while true; do
        file=$count
        if [ -d "/home/glaucus/logs/system/$file" ]; then
                count=$(($count + 1))
        else
                break
        fi
done
mkdir /home/glaucus/logs/system/$file
(dash /home/glaucus/scripts/system/construct.sh | tee /home/glaucus/logs/system/$file/stdout.log) 3>&1 1>&2 2>&3 | tee /home/glaucus/logs/system/$file/stderr.log
