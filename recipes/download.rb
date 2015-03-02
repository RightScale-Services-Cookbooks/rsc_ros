#
# Cookbook Name:: rsc_ros
# Recipe:: download
#
# Copyright 2015, RightScale
#
# All rights reserved - Do Not Redistribute
#

download_script = "/tmp/rsc_ros_#{SecureRandom.urlsafe_base64}.rb"

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
