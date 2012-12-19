package 'python-software-properties'

execute 'apt-add-repository ppa:hippiehacker/ii -y ; apt-get update' do
  creates '/etc/apt/sources.list.d/hippiehacker-ii-precise.list'
end

# %w{dell-recovery dell-recovery-bootloader}.each do |p|
#   package p do
#     version '1.24.1-1ii'
#   end
# end

# %w{usb-creator-common usb-creator-gtk}.each do |p|
#   package p do
#     version '0.2.41-1ii'
#   end
# end

