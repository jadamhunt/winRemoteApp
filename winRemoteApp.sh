#!/bin/bash

# Create an empty VM

lxc init win10 --profile default --empty --vm -c security.secureboot=false -c limits.cpu=4 -c limits.memory=8GB

# Grow grow root disk
lxc config device override win10 root size=40GB

# Enable temporary install and drivers media
echo -n '-drive file=$HOME/ISOs/Tiny10.iso,index=0,media=cdrom,if=ide -drive file=/home/jhunt/win/virtiowin.iso,index=1,media=cdrom,if=ide' | lxc config set win10 raw.qemu

# modify apparmor settings for VM read/write permissions
lxc config set win10 raw.apparmor "/home/** rwk,"

