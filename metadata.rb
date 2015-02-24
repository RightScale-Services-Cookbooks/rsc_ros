name             'rsc_ros'
maintainer       'RightScale'
maintainer_email 'ps@rightscale.com'
license          'All rights reserved'
description      'Installs/Configures rsc_ros'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

%w{ ubuntu }.each do |os|
  supports os
end

recipe 'rsc_ros::default'       , 'Install and configure Fog, download file from bucket.'
recipe 'rsc_ros::configure_fog' , 'Configure .fog credentials file.'
recipe 'rsc_ros::install_fog'   , 'Install fog and associated gems.'
recipe 'rsc_ros::install_ruby'  , 'Install ruby if needed'

attribute 'rsc_ros/storage_provider',
  :display_name => 'Storage Provider',
  :description  => 'Storage provider which houses file to download.',
  :type         => 'string',
  :recipes      => ['rsc_ros::configure_fog'],
  :choice       => ['aws', 'rackspace', 'google'],
  :required     => 'required'

attribute 'rsc_ros/access_key',
  :display_name => 'Access Key',
  :description  => 'Access key to use with storage provider.',
  :type         => 'string',
  :recipes      => ['rsc_ros::configure_fog'],
  :required     => 'required'

attribute 'rsc_ros/secret_key',
  :display_name => 'Secret Key',
  :description  => 'Secret key to use with storage provider.',
  :type         => 'string',
  :recipes      => ['rsc_ros::configure_fog'],
  :required     => 'required'

attribute 'rsc_ros/bucket',
  :display_name => 'Bucket',
  :description  => 'Bucket from where to download data.',
  :type         => 'string',
  :recipes      => ['rsc_ros::download_file'],
  :required     => 'required'

attribute 'rsc_ros/file',
  :display_name => 'File',
  :description  => 'File to download from bucket.',
  :type         => 'string',
  :recipes      => ['rsc_ros::download_file'],
  :required     => 'required'
