#!/usr/bin/dash -ex
sudo rm -frv $CBLD $CRSL $CRSS
install -dv $CBLD $CRSS
sudo ln -fsv $CRSS /
