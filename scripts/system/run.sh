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
sh /home/glaucus/scripts/system/construct.sh 2> /home/glaucus/logs/system/$file/stderr.log > /home/glaucus/logs/system/$file/stdout.log
