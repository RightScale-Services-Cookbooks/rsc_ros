#
# Cookbook Name:: rsc_ros
# Recipe:: install_ruby
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

#dev_packages = %w[ruby ruby-dev patch autoconf automake gcc g++ libxml2 libxml2-dbg libxslt-dev zlib1g-dev]
dev_packages = %w[ruby ruby-dev patch autoconf automake gcc g++]

dev_packages.each do |pkg|
  package "#{pkg}"
end
