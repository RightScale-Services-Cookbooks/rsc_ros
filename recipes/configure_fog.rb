#
# Cookbook Name:: rsc_ros
# Recipe:: configure_fog
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

template "/root/.fog" do
  source "fog.erb"
  mode 0600
  owner "root"
  group "root"
  variables({
    :provider   => node[:rsc_ros][:storage_provider],
    :access_key => node[:rsc_ros][:access_key],
    :secret_key => node[:rsc_ros][:secret_key]
  })
end
