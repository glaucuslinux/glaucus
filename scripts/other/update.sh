#!/usr/bin/dash -e
/usr/bin/git submodule foreach git pull
find /home/glaucus/cerata -name .hg -execdir /usr/bin/hg pull -u \;
find /home/glaucus/cerata -name .svn -execdir /usr/bin/svn update \;
