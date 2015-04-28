cookbook_file '/etc/yum.repos.d/rightscale-epel.repo' do
  source 'rightscale-epel.repo'
  owner 'root'
  group 'root'
  mode 0644
end
