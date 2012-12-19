execute 'bto-autobuilder' do
  command <<-EOC
    /usr/share/dell/bin/dell-bto-autobuilder \
      --base-iso=#{node['ii-iso']['ubuntu-iso']['src']['cache']} \
      --drivers=#{node['ii-iso']['fish-drivers-file']} \
      --target-name=#{node['ii-iso']['ubuntu-iso']['target']['name']} \
      --target-dir=#{node['ii-iso']['ubuntu-iso']['target']['dir']}
    EOC
  creates File.join(
    node['ii-iso']['ubuntu-iso']['target']['dir'],
    node['ii-iso']['ubuntu-iso']['target']['name'])
end
