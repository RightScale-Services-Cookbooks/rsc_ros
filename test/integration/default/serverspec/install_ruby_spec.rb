require 'serverspec'

set :backend, :exec

describe package("ruby") do
  it { should be_installed }
end

describe package("ruby-dev") do
  it { should be_installed }
end

describe file("/usr/bin/gem") do
  it { should be_file }
end
