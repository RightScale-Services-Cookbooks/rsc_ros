require_relative 'spec_helper'

describe 'rsc_ros::default' do
  let(:chef_run) do
    ChefSpec::Runner.new do |node|
      node.set['rsc_ros']['packages']=%w[ruby ruby-dev make autoconf automake g++ patch zlib1g-dev]
    end.converge(described_recipe)
  end

  it 'installs ruby' do
    expect(chef_run).to install_package('ruby')
  end

  it 'creates /usr/local/bin/ros_download.rb' do
    expect(chef_run).to create_cookbook_file("/usr/local/bin/ros_download.rb")
  end
end
