case node[:platform]
when "ubuntu", "debian"
  # Base ServerTemplate for Linux (v14.1.0) [rev 50]
  # Ubuntu 14.04
  #default[:rsc_ros][:packages] = %w[ruby ruby-dev patch autoconf automake gcc g++]
  default[:rsc_ros][:packages] = %w[ruby ruby-dev autoconf automake g++ patch]
  default[:rsc_ros][:gems]     = %w[fog]

when "redhat", "centos"
  default[:rsc_ros][:packages] = %w[ruby ruby-devel rubygems]
end
