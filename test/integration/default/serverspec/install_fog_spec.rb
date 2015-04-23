require 'serverspec'

set :backend, :exec

describe package("fog") do
  it { should be_installed.by("gem") }
end

describe package("mixlib-cli") do
  it { should be_installed.by("gem") }
end
