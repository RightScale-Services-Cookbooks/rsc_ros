require 'spec_helper'

describe 'rsc_ros::download' do
  let(:chef_run) do
    ChefSpec::Runner.new(platform: 'centos', version: '6.5') do |node|
      node.set['rsc_ros']['destination'] = '/tmp/archive_download.tar.bz2'
      node.set['rsc_ros']['storage_provider'] = 'aws'
      node.set['rsc_ros']['access_key'] = 'key'
      node.set['rsc_ros']['secret_key'] = 'key'
      node.set['rsc_ros']['bucket'] = 'bucket'
      node.set['rsc_ros']['destination'] = 'destination'
      node.set['rsc_ros']['file'] = 'file'
    end.converge(described_recipe)
  end

  it 'includes the default recipe' do
    expect(chef_run).to include_recipe('rsc_ros::default')
  end

  it 'downloads a file from the cloud' do
    expect(chef_run).to download_rsc_ros(chef_run.node['rsc_ros']['destination'])
  end
end
