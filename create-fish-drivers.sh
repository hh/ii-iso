#!/bin/bash
mydir=`dirname $0`
if [ "$mydir" = "." ] ; then
  mydir=`pwd`
fi

TMPDIR=/run/shm # This builds crazy fast on my machine
#TMPDIR=/tmp # Use this if you don't have enough room

# FISH_DIR is a tmpdir that we will delete when done
FISH_DIR=$(mktemp -d -p ${TMPDIR} grubby-recovery.XXXX)
cd $FISH_DIR

# What other interesting things can go in factory.. configs, git checkouts?
# So far these are mainly custom built grub binaries and the grub.cfg
mkdir factory
cp -a ${mydir}/ii-chef factory/chef
cp -a /var/lib/dell-recovery/{grub.cfg,grubx64.efi} factory
cp -a /var/lib/dell-recovery/{boot,core}.img factory

# pcbios grub needs to be detected and installed correctly
mkdir boot
cp -a /var/lib/dell-recovery/iso boot/grub

# usb-creator-common_0.2.41_amd64.deb  usb-creator-gtk_0.2.41_amd64.deb
# to overcome the 16.4k size limit before the partition
# Testing ./debs vs ./debs/main

mkdir -p debs/main
cp -a ${mydir}/debs/*deb  debs

# Put this into a fish, and add the tgz file to a driver file 
tar cvfz ${mydir}/grubby-fish.tgz .
echo ${mydir}/grubby-fish.tgz > ${mydir}/fish-drivers

# clean ourselves up
cd -
rm -rf $FISH_DIR
