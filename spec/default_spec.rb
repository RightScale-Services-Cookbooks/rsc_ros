require_relative 'spec_helper'

describe 'rsc_ros::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'installs ruby' do
    expect(chef_run).to install_package('ruby')
  end

  it 'creates /usr/local/bin/ros_download.rb' do
    expect(chef_run).to create_cookbook_file("/usr/local/bin/ros_download.rb")
  end
end
