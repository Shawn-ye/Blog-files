#!/bin/sh


wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.16/linux-image-4.16.0-041600-generic_4.16.0-041600.201804012230_amd64.deb
dpkg -i linux-image-4.*.deb
update-grub
reboot