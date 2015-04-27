if defined?(ChefSpec)
  def download_rsc_ros(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new('rsc_ros', :download, resource_name)
  end
end
