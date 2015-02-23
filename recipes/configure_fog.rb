#
# Cookbook Name:: rsc_ros
# Recipe:: configure_fog
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

template "/tmp/fog.rb" do
  source "fog.rb.erb"
  mode 0700
  owner "root"
  group "root"
  variables({
    :access_key => node[:rsc_ros][:access_key],
    :secret_key => node[:rsc_ros][:secret_key]
  })
end
