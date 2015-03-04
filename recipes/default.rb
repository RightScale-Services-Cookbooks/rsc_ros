#
# Cookbook Name:: rsc_ros
# Recipe:: default
#
# Copyright 2015, RightScale
#
# All rights reserved - Do Not Redistribute
#
node[:rsc_ros][:packages].each do |pkg|
  p=package pkg do
    action :nothing
  end
  p.run_action(:install)
end

#INSTALL GEMS
gem 'mixlib-cli' do
  action :install
  gem_binary "/usr/bin/gem"
  options("--no-rdoc --no-ri")
end

gem 'fog' do
  action :install
  gem_binary "/usr/bin/gem"
  options("--no-rdoc --no-ri")
end

chef_gem 'mixlib-cli' do
  action :install
end

chef_gem 'fog' do
  action :install
end

cookbook_file "/usr/local/bin/ros_download.rb" do
  source "ros_download.rb"
  owner "root"
  group "root"
  mode 0755
  action :create
end
