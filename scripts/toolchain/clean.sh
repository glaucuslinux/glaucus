#!/usr/bin/dash -ex
sudo rm -frv $TBLD $TLCL $TLCH
install -dv $TBLD $TLCH
sudo ln -fsv $TLCH /
