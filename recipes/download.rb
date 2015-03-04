rsc_ros node[:rsc_ros][:destination] do
  provider node[:rsc_ros][:provider]
  access_key node[:rsc_ros][:access_key]
  secret_key node[:rsc_ros][:secret_key]
  bucket node[:rsc_ros][:bucket]
  file node[:rsc_ros][:file]
  action :download
end
