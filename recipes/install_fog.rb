#
# Cookbook Name:: rsc_ros
# Recipe:: install_fog
#
# Copyright 2015, RightScale
#
# All rights reserved - Do Not Redistribute
#

gem_package "fog" do
  action :install
  gem_binary "/usr/bin/gem"
  options("--no-rdoc --no-ri")
end
