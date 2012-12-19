default['ii-iso']['ubuntu-iso']['src'] = {
  'url' => 'http://releases.ubuntu.com/precise/ubuntu-12.04.1-server-amd64.iso',
  'checksum' => 'd942fd8a056f635062899b58e9e875eb89eaec9be09a0fefa713f4e162bb647e',
  'cache' => File.join(Chef::Config[:file_cache_path],'ubuntu-12.04.1-desktop-amd64.iso')
}
default['ii-iso']['use-run-shm'] = true # at some point, calculate on available memory
default['ii-iso']['fish-driver-dir']=File.join(Chef::Config[:file_cache_path],'fish-driver-dir')
default['ii-iso']['fish-drivers-file']=File.join(Chef::Config[:file_cache_path],'fish-driver-dir','fish.drivers')
default['ii-iso']['ubuntu-iso']['target'] = {
  'name' => 'ii-ubuntu-12.04-amd64-opscode-training-0.0.1.iso',
  'dir' => '/run/shm/ii'
}


# Include our modified dell-recovery
default['ii-iso']['fish-debs']['dell-recovery'] = {
  'url' => 'https://launchpad.net/~hippiehacker/+archive/ii/+files/dell-recovery_1.24.1-1ii_all.deb',
  'checksum' => 'a1a024fd5e3cd0bfb329c7df7316fe74a1b45b8dc6d1ace65fe34181e69f61ae'
}
default['ii-iso']['fish-debs']['usb-creator-gtk'] = {
  'url' => 'https://launchpad.net/~hippiehacker/+archive/ii/+files/usb-creator-gtk_0.2.41-1ii_amd64.deb',
  'checksum' => '00b6e8f7fece09961177e567dab93104fa5b231b681143671d17fddfca00eeb2'
}
default['ii-iso']['fish-debs']['usb-creator-common'] = {
  'url' => 'https://launchpad.net/~hippiehacker/+archive/ii/+files/usb-creator-common_0.2.41-1ii_amd64.deb',
  'checksum' => 'c26b6a2cdc1afcd82366c9eb24b8bd1486cf4f8ef9d89653bb5f8dc33735f530'
}

