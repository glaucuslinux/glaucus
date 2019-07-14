#!/usr/bin/dash -ex
sudo rm -frv $TBLD $TOOL /home/glaucus/toolchain
mkdir -v $TBLD /home/glaucus/toolchain
sudo ln -fsv /home/glaucus/toolchain $TOOL
