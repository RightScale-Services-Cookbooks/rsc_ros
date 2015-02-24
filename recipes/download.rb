#
# Cookbook Name:: rsc_ros
# Recipe:: download
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

template "/tmp/rsc_ros_#{SecureRandom.urlsafe_base64}.rb" do
  source "download.erb"
  owner "root"
  group "root"
  mode 0700
  variables({
    :provider    => node[:rsc_ros][:storage_provider],
    :access_key  => node[:rsc_ros][:access_key],
    :secret_key  => node[:rsc_ros][:secret_key],
    :bucket      => node[:rsc_ros][:bucket],
    :file        => node[:rsc_ros][:file],
    :destination => node[:rsc_ros][:destination]
  })
end
