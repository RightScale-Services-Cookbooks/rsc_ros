#
# Cookbook Name:: rsc_ros
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'rsc_ros::install_ruby'
include_recipe 'rsc_ros::install_fog'
include_recipe 'rsc_ros::configure_fog'
