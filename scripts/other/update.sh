#!/usr/bin/dash -e
git submodule foreach git pull
find /home/glaucus/cerata -name .hg -execdir hg pull -u \;
find /home/glaucus/cerata -name .svn -execdir svn update \;
