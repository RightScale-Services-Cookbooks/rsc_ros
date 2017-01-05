provides :rsc_ros
resource_name :rsc_ros
actions :download, :upload
default_action :download

attribute :storage_provider, kind_of: String, required: true
attribute :access_key, kind_of: String, required: true
attribute :secret_key, kind_of: String, required: true
attribute :bucket, kind_of: String, required: true
attribute :file, kind_of: String, required: true
attribute :destination, kind_of: String, required: true
attribute :region, kind_of: String, default: nil, required: false
attribute :timeout, kind_of: Integer, default: 1200, required: false
