deb_fish_dir = File.join(node['ii-iso']['fish-driver-dir'],'debs')

directory File.join(deb_fish_dir,'factory','debs') do
  recursive true
end

node['ii-iso']['fish-debs'].each do |name,attribs|
  remote_file "#{deb_fish_dir}/factory/debs/#{File.basename(attribs['url'])}" do
    source attribs['url']
    checksum attribs['checksum']
    notifies :run, 'execute[create deb fish driver]'
  end
end

execute 'create deb fish driver' do
  command "tar cvfz #{deb_fish_dir}.tgz ."
  cwd deb_fish_dir
  creates "#{deb_fish_dir}.tgz"
end

node.run_state[:seen_fish] << "#{deb_fish_dir}.tgz"
