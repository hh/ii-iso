# sudo apt-add-repository ppa:hippiehacker/ii
# sudo apt-get update
# sudo apt-get upgrade
# sudo apt-get install dell-recovery dell-recovery-bootloader usb-creator-gtk

# Make sure it's the version from ppa:hippiehacker/ii

FISH_DIR=$(mktemp -d -p /run/shm grubby-recovery.XXXX)
cd $FISH_DIR

# What other interesting things can go in factory.. configs, git checkouts?
# So far these are mainly custom build grub binaries and the grub.cfg
# at what point does this grub.cfg get checked?
mkdir factory
cp -a ~/ii/ii-chef factory/chef
cp -a /var/lib/dell-recovery/{grub.cfg,grub-setup.exe,grubx64.efi} factory
cp -a /var/lib/dell-recovery/{boot,core}.img factory

# pcbios grub needs to be detected and installed correctly
mkdir boot

# copy standard (are these customized?) eltorito.img and i386-pc grub files into /boot/grub
# this also copies in dell-recovery/iso/i386-pc/{boot.img,core.img}
cp -a /var/lib/dell-recovery/iso boot/grub

# usb-creator-common_0.2.41_amd64.deb  usb-creator-gtk_0.2.41_amd64.deb
# to overcome the 16.4k size limit before the partition
# Testing ./debs vs ./debs/main
mkdir -p debs/main
cp -a ~/ii/debs/*deb  debs

# How would I utilize scripts/emergency.sh?
# mkdir scripts
# cat <<EOF>scripts/emergency.sh
# # force these to upgrade as well!
# chroot /root apt-get install usb-creator-common -y --no-install-recommends
# chroot /root apt-get install usb-creator-gtk -y --no-install-recommends
# echo WE UPDATED USB_CREATOR > /root/USBUPDATED.tetx
# EOF

# mkdir .disk
# uuid > .disk/casper-uuid

# Put this into a fish, and add the tgz file to a driver file 
tar cvfz /tmp/grubby-fish.tgz .
echo /tmp/grubby-fish.tgz > /tmp/fish-drivers

# clean ourselves up
cd -
rm -rf $FISH_DIR

#apt-get install python-progressbar
/usr/share/dell/bin/dell-bto-autobuilder  -b /share/iso/ubuntu-12.04-desktop-amd64.iso -d /tmp/fish-drivers --target-name-prefix=ii --dell-recovery /home/hh/ii/dell-recovery_1.24.1001_all.deb --target-dir=/run/shm
# /usr/share/dell/bin/dell-bto-autobuilder  -b /home/hh/ucktmp/remaster-new-files/livecd.iso -d /tmp/fish-drivers --target-name-prefix=ii --dell-recovery /home/hh/ii/dell-recovery_1.24.1001_all.deb --target-dir=/run/shm
#  -t 123456789 # must be an integer?

kvm -cdrom /run/shm/ii*iso

# dell-recovery -t /run/shm -m usb --burn # fails to create the .disk/casper-uuid # methinks BUG
usb-creator-gtk -n --iso /run/shm/ii-ubuntu-12.04-amd64-dell_X00.iso # works 
