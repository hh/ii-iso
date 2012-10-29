#!/bin/bash

mydir=`dirname $0`
if [ "$mydir" = "." ] ; then
  mydir=`pwd`
fi



#apt-get install python-progressbar
echo run "/usr/share/dell/bin/dell-bto-autobuilder  -b /share/iso/ubuntu-12.04-desktop-amd64.iso -d /tmp/fish-drivers --target-name-prefix=ii --target-dir=${TMPDIR}"

echo 'run "kvm -cdrom ${TMPDIR}/ii*iso"'

# dell-recovery -t /run/shm -m usb --burn # fails to create the .disk/casper-uuid # methinks BUG
echo 'run "usb-creator-gtk -n --iso ${TMPDIR}/ii-ubuntu-12.04-amd64-dell_X00.iso"' # works "
