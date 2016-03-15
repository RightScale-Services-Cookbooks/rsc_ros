name             'rsc_ros'
maintainer       'RightScale'
maintainer_email 'ps@rightscale.com'
license          'All rights reserved'
description      'Installs/Configures rsc_ros'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.4.0'

%w{ centos ubuntu }.each do |os|
  supports os
end

recipe 'rsc_ros::default'       , 'Install and configure Fog.'
recipe 'rsc_ros::download'      , 'Download file from bucket.'
recipe 'rsc_ros::upload'        , 'Upload file from filesystem'

attribute 'rsc_ros/storage_provider',
  :display_name => 'Storage Provider',
  :description  => 'Storage provider which houses file to download.',
  :type         => 'string',
  :recipes      => ['rsc_ros::download'],
  :choice       => ['aws', 'google', 'rackspace'],
  :required     => 'required'

attribute 'rsc_ros/access_key',
  :display_name => 'Access Key',
  :description  => 'Access key to use with storage provider.',
  :type         => 'string',
  :recipes      => ['rsc_ros::download'],
  :required     => 'required'

attribute 'rsc_ros/secret_key',
  :display_name => 'Secret Key',
  :description  => 'Secret key to use with storage provider.',
  :type         => 'string',
  :recipes      => ['rsc_ros::download'],
  :required     => 'required'

attribute 'rsc_ros/bucket',
  :display_name => 'Bucket',
  :description  => 'Bucket from where to download data.',
  :type         => 'string',
  :recipes      => ['rsc_ros::download'],
  :required     => 'required'

attribute 'rsc_ros/file',
  :display_name => 'File',
  :description  => 'File to download from bucket.',
  :type         => 'string',
  :recipes      => ['rsc_ros::download'],
  :required     => 'required'

attribute 'rsc_ros/destination',
  :display_name => 'Destination',
  :description  => 'Full path where file is to be downloaded (ex: /var/tmp/archive.tar.gz).',
  :type         => 'string',
  :recipes      => ['rsc_ros::download'],
  :required     => 'required'

  attribute 'rsc_ros/region',
    :display_name => 'Region',
    :description  => 'Cloud region',
    :type         => 'string',
    :recipes      => ['rsc_ros::download'],
    :required     => 'optional'
