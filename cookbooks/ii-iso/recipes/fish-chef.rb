custom_fish_dir = File.join(node['ii-iso']['fish-driver-dir'],'custom')

directory File.join(custom_fish_dir,'factory','chef') do
  recursive true
end

%w{ validation.pem client.rb node-editor.desktop node-update.desktop }.each do |ii_file|
  template "#{custom_fish_dir}/factory/chef/#{ii_file}" do
    source "#{ii_file}.erb"
    notifies :run, 'execute[create custom fish driver]'
  end
end

execute 'create custom fish driver' do
  command "tar cvfz #{custom_fish_dir}.tgz ."
  cwd custom_fish_dir
  creates "#{custom_fish_dir}.tgz"
end
