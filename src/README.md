# We need some modified ubuntu packages... bzr here we come
```
bzr branch lp:~hippiehacker/ii/dell-recovery.precise
cd dell-recovery.precise
dpkg-buildpackage -b
cd ..
dpkg -i dell-recovery_1.24.1-1ii_all.deb
```

# To upload to the ppa, you need source only changes
```
bzr branch lp:~hippiehacker/ii/dell-recovery.precise
cd dell-recovery.precise
# bump debian/changlog
debuild -S -sa -i -D
dput ppa:hippiehacker/ii ../dell-recovery_1.24.1-1ii_source.changes
```

```
bzr branch lp:~hippiehacker/ii/usb-creator
cd usb-creator
dpkg-buildpackage -b
cd ..
sudo dpkg -i usb-creator-common_0.2.41_amd64.deb usb-creator-gtk_0.2.41_amd64.deb 
```

# To upload to the ppa, you need source only changes
```
bzr branch lp:~hippiehacker/ii/usb-creator
cd usb-creator
# bump debian/changlog
debuild -S -sa -i -D
dput ppa:hippiehacker/ii ../usb-creator_1.24.100X_source.changes
```