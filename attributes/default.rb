case node['platform']
when "ubuntu", "debian"
  # Tested with: Base ServerTemplate for Linux (v14.1.0) [rev 50] / Ubuntu 14.04
  default['rsc_ros']['packages'] = %w[ruby ruby-dev make autoconf automake g++ patch zlib1g-dev]

when "redhat", "centos"
  # Tested with: Base ServerTemplate for Linux (v14.1.0) [rev 50] / CentOS 6.5
  default['rsc_ros']['packages'] = %w[ruby19 ruby19-devel gcc-c++ patch zlib-devel]
else
  raise "Sorry #{node['platform']} is not supported ..."
end

default['rsc_ros']['gems'] = { "fog" => "1.36.0", "mixlib-cli" => "1.5.0", 'mime-types'=>'1.25.0', 'fog-profitblocks'=>'0.0.5' }
default['rsc_ros']['timeout']=1200
