case node[:platform]
when "ubuntu", "debian"
  default[:rsc_ros][:packages] = %w[ruby ruby-dev patch autoconf automake gcc g++]

when "redhat", "centos" 
  default[:rsc_ros][:packages] = %w[ruby ruby-devel rubygems]
end
