#!/usr/bin/dash -ex
cd /home/glaucus
git config --global user.name "Firas Khalil Khana"
git config --global user.email "firasuke@gmail.com"
mkdir -pv \
        tools \
        tools/cross \
        tools/toolchain \
        logs/cross \
        logs/system \
        logs/toolchain \
        play \
        system \
        temporary/cross/builds \
        temporary/cross/sources \
        temporary/system/builds \
        temporary/system/cerata \
        temporary/system/sources \
        temporary/toolchain/builds \
        temporary/toolchain/sources
