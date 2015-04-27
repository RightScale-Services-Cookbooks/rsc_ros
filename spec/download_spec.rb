require_relative 'spec_helper'

describe 'rsc_ros::download' do
  let(:chef_run) do
    ChefSpec::Runner.new(platform: 'centos', version: '6.5') do |node|
      node.set['rsc_ros']['destination'] = '/tmp/filename'
    end.converge(described_recipe)
  end

  it 'includes the default recipe' do
    expect(chef_run).to include_recipe('rsc_ros::default')
  end

  it 'created /tmp/filename' do
    expect(chef_run).to download_rsc_ros(chef_run.node['rsc_ros']['destination'])
  end
end
