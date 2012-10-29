The ii-usb-creator.sh should be looked at, but basically creates a /tmp/grubby-fish.tgz with:

* the contents of ii-chef
* the modified grub images and configs from /var/lib/dell-recovery
* debs/*deb

And passes that to dell-bto-autobuilder

ii-chef/validation.pem and ii-chef/client.rb should be updated (and can also be updated directly on the usb/isos this creates) to point to other chef servers / organziations.

The creation of the usb basically requires a fork of dell-recovery and usb-creator

* https://code.launchpad.net/~hippiehacker/ii/dell-recovery.precise
* https://code.launchpad.net/~hippiehacker/ii/usb-creator

That get's published in my ppa

* https://launchpad.net/~hippiehacker/+archive/ii

And all of that can be installed on a precise host by doing the following:

```
sudo apt-add-repository ppa:hippiehacker/ii
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install dell-recovery
sudo apt-get install dell-recovery-bootloader
sudo apt-get install usb-recovery
```