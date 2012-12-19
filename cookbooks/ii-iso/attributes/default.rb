default['ii-iso']['ubuntu-iso']['src'] = {
  'url' => 'http://releases.ubuntu.com/precise/ubuntu-12.04.1-server-amd64.iso',
  'checksum' => 'd942fd8a056f635062899b58e9e875eb89eaec9be09a0fefa713f4e162bb647e'
}
default['ii-iso']['ubuntu-iso']['cache'] = '/srv/mirror/iso/ubuntu-12.04.1-desktop-amd64.iso'
default['ii-iso']['use-run-shm'] = true # at some point, calculate on available memory
default['ii-iso']['fish-driver-dir']=File.join(Chef::Config[:file_cache_path],'fish-driver-dir')


default['ii-iso']['fish-debs']['dell-recovery'] = {
  'url' => 'https://launchpad.net/~hippiehacker/+archive/ii/+files/dell-recovery_1.24.1-1ii_all.deb',
  'checksum' => 'a1a024fd5e3cd0bfb329c7df7316fe74a1b45b8dc6d1ace65fe34181e69f61ae'
}

