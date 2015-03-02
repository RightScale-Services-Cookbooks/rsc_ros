#
# Cookbook Name:: rsc_ros
# Recipe:: download
#
# Copyright 2015, RightScale
#
# All rights reserved - Do Not Redistribute
#

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

download_script = "/tmp/rsc_ros_#{SecureRandom.urlsafe_base64}.rb"
node.default[:rsc_ros][:download_script] = download_script

@credentials={}
@credentials[:provider]=node[:rsc_ros][:storage_provider]
case node[:rsc_ros][:storage_provider].downcase
when "aws"
  @credentials={
    :aws_access_key_id => node[:rsc_ros][:access_key],
    :aws_secret_access_key => node[:rsc_ros][:secret_key]
  }
when "rackspace"
  @credentials={
    :rackspace_username => node[:rsc_ros][:access_key],
    :rackspace_api_key  => node[:rsc_ros][:secret_key]
  }
when "google"
  @credentials={
    :google_storage_access_key_id => node[:rsc_ros][:access_key],
    :google_storage_secret_access_key => node[:rsc_ros][:secret_key]
  }
end

template download_script do
  source "download.erb"
  owner "root"
  group "root"
  mode 0700
  variables({
    :credentials => @credentials,
    :bucket      => node[:rsc_ros][:bucket],
    :file        => node[:rsc_ros][:file],
    :destination => node[:rsc_ros][:destination]
  })
end

execute download_script
execute "rm #{download_script}"
