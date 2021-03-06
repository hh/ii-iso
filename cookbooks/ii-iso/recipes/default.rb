#
# Cookbook Name:: ii-iso
# Recipe:: default
#
# Copyright 2012, Chris McClimans
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'ii-iso::ppa'
include_recipe 'ii-iso::src-iso'

node.run_state[:seen_fish]=[]

include_recipe 'ii-iso::fish-grub'
include_recipe 'ii-iso::fish-debs'
include_recipe 'ii-iso::fish-chef'

file node['ii-iso']['fish-drivers-file'] do
  content node.run_state[:seen_fish].join("\n")+"\n"
end

include_recipe 'ii-iso::build-to-order'



