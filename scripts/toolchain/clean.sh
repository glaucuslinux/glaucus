#!/usr/bin/dash -ex
sudo rm -frv $TBLD $TOOL $CROS
mkdir -v $TBLD $CROS $CROS/toolchain
sudo ln -fsv $CROS/toolchain /
