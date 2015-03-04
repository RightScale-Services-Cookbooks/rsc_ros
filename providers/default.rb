require 'mixlib/shellout'

action :download do
  cmd='/usr/local/bin/ros_download.rb'
  cmd+=" -c #{@new_resource.provider}"
  cmd+=" -u #{@new_resource.access_key}"
  cmd+=" -p #{@new_resource.secret_key}"
  cmd+=" -b #{@new_resource.bucket}"
  cmd+=" -f #{@new_resource.file}"
  cmd+=" -d #{@new_resource.destination}"
  result=Mixlib::ShellOut.new(cmd).run_command
  Chef::Log.info "cmd:#{cmd}, STDOUT:#{result.stdout}, STDERR:#{result.stderr}"
  result.error!
  new_resource.updated_by_last_action(true)
end

action :upload do
#not implemented yet
end
