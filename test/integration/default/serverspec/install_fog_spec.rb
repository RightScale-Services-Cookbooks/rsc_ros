require 'serverspec'

set :backend, :exec

describe package("fog") do
  it { should be_installed.by("gem") }
end
