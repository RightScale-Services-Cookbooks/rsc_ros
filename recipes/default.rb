#
# Cookbook Name:: rsc_ros
# Recipe:: default
#
# Copyright 2015, RightScale
#
# All rights reserved - Do Not Redistribute
#

# Install package deps
node[:rsc_ros][:packages].each do |pkg|
  p = package pkg do
    action :nothing
  end
  p.run_action(:install)
end

# Install gem deps
node[:rsc_ros][:gems].each do |g|
  gem_package g do
    gem_binary "/usr/bin/gem"
    options("--no-rdoc --no-ri")
    action :install
  end
end


cookbook_file "/usr/local/bin/ros_download.rb" do
  source "ros_download.rb"
  owner "root"
  group "root"
  mode 0755
  action :create
end








# doesn't install on Linux Base image v14.1.0 [rev 50]
# RightImage_CentOS_6.5_x64_v14.1.3_HVM_EBS
# Errors out on fog deps
#__END__
#INSTALL GEMS
#gem 'mixlib-cli' do
  #action :install
  #gem_binary "/usr/bin/gem"
  #options("--no-rdoc --no-ri")
#end

#gem 'fog' do
  #action :install
  #gem_binary "/usr/bin/gem"
  #options("--no-rdoc --no-ri")
#end

#chef_gem 'mixlib-cli' do
  #action :install
#end

#chef_gem 'fog' do
  #action :install
#end

#cookbook_file "/usr/local/bin/ros_download.rb" do
  #source "ros_download.rb"
  #owner "root"
  #group "root"
  #mode 0755
  #action :create
#end
