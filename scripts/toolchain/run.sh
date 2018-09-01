#!/usr/bin/dash -ex

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
sh /home/glaucus/scripts/toolchain/construct.sh 2> /home/glaucus/logs/toolchain/$file/stderr.log > /home/glaucus/logs/toolchain/$file/stdout.log
