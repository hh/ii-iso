remote_file node['ii-iso']['ubuntu-iso']['cache'] do
  source node['ii-iso']['ubuntu-iso']['src']['url']
  checksum node['ii-iso']['ubuntu-iso']['src']['checksum']
  not_if {File.exists? node['ii-iso']['ubuntu-iso']['cache']}
end
