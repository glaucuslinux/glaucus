#!/bin/dash -ex
git submodule foreach git pull
find /home/glaucus/cerata -name .svn -execdir svn update \;
