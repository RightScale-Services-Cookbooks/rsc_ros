require 'serverspec'

set :backend, :exec

describe "Ruby" do
  it "ruby package should be installed" do
    expect(package("ruby")).to be_installed
  end
  
  it "gems should be installed" do
    expect(file("/usr/bin/gem")).to be_file
  end

  it "ruby dev package should be installed" do
    expect(package("ruby-dev")).to be_installed
  end
end
