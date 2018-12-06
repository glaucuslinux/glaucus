#!/bin/dash -ex

find /home/glaucus/cerata -name .git -execdir git pull \;
find /home/glaucus/cerata -name .svn -execdir svn update \;
