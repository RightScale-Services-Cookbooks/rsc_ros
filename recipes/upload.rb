include_recipe "rsc_ros::default"

rsc_ros node['rsc_ros']['file'] do
  storage_provider  node['rsc_ros']['storage_provider']
  access_key        node['rsc_ros']['access_key']
  secret_key        node['rsc_ros']['secret_key']
  bucket            node['rsc_ros']['bucket']
  file              node['rsc_ros']['file']
  region            node['rsc_ros']['region']
  action            :upload
end
