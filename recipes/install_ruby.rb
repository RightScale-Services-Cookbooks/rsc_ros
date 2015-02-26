#
# Cookbook Name:: rsc_ros
# Recipe:: install_ruby
#
# Copyright 2015, RightScale
#
# All rights reserved - Do Not Redistribute
#

node[:rsc_ros][:packages].each do |pkg|
  package pkg
end
