#!/bin/bash
set -x
set -e
MYDIR=`dirname $0`
if [ "$MYDIR" = "." ] ; then
  MYDIR=`pwd`
fi


TMPDIR=/run/shm/ii
UBUNTUISO=/share/iso/ubuntu-12.04-desktop-amd64.iso

$MYDIR/create-fish-drivers.sh

# this is broken on my box, but used to work...
/usr/share/dell/bin/dell-bto-autobuilder  -b $UBUNTUISO -d $MYDIR/fish-drivers --target-name-prefix=ii --target-dir=$TMPDIR

#launching it manually via dell-recovery
# and choosing a 12.04 amd64 iso and the installed dell-recovery software (from my ppa)
# and the grubby-fish.tgz drivers file
# results in a working iso / cdrom

echo 'run "kvm -cdrom ${TMPDIR}/ii*iso"'

# dell-recovery -t /run/shm -m usb --burn # fails to create the .disk/casper-uuid # methinks BUG
echo 'run "usb-creator-gtk -n --iso ${TMPDIR}/ii-ubuntu-12.04-amd64-dell_X00.iso"' # works "
