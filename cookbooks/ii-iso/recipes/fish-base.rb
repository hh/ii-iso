base_fish_dir = File.join(node['ii-iso']['fish-driver-dir'],'base')

directory File.join(base_fish_dir,'factory') do
  recursive true
end

directory File.join(base_fish_dir,'boot/grub/i386-pc') do
  recursive true
end

#the contents of all these files have been modified by our custom build of dell-recovery
#https://launchpad.net/~hippiehacker/+archive/ii/+packages

%w{ grub.cfg grubx64.efi boot.img core.img }.each do |bootfile|
  file File.join(base_fish_dir,'factory',bootfile) do
    content open(File.join('/var/lib/dell-recovery',bootfile)).read
    notifies :run, 'execute[create base fish driver]'
  end
end

file File.join(base_fish_dir,'boot/grub/eltorito.img') do
  content open('/var/lib/dell-recovery/iso/eltorito.img').read
  notifies :run, 'execute[create base fish driver]'
end

Dir['/var/lib/dell-recovery/iso/i386-pc/*'].each do |grub_mod|
  grub_mod = File.basename(grub_mod)
  file File.join(base_fish_dir,'boot/grub/i386-pc',grub_mod) do
    content open(File.join('/var/lib/dell-recovery/iso/i386-pc',grub_mod)).read
    notifies :run, 'execute[create base fish driver]'
  end
end

execute 'create base fish driver' do
  command "tar cvfz #{base_fish_dir}.tgz ."
  cwd base_fish_dir
  creates "#{base_fish_dir}.tgz"
end
