#!/bin/sh -e
qemu-system-x86_64 -enable-kvm -cpu host -m 64M -drive format=raw,file=/home/glaucus/glaucus.img
