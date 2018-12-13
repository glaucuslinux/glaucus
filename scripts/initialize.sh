#!/bin/dash -ex

cd /home/glaucus

git config --global user.name "Firas Khalil Khana"
git config --global user.email "firasuke@gmail.com"

mkdir -pv logs/system
mkdir -pv logs/toolchain
mkdir -v play
mkdir -v system
mkdir -pv temporary/system/builds
mkdir -v temporary/system/sources
mkdir -pv temporary/toolchain/builds
mkdir -v temporary/toolchain/sources
mkdir -v toolchain
