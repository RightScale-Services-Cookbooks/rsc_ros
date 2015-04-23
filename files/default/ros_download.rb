#!/usr/bin/env ruby

require 'rubygems'
require 'fog'
require 'mixlib/cli'
#setup options

class MyCLI
  include Mixlib::CLI

  option :provider,
    :short       => "-c cloud",
    :long        => "--cloud cloud",
    :required    => true,
    :description => "Cloud name: aws, rackspace, google"

  option :access_key,
    :short       => "-u access_key",
    :long        => "--user ACCESS_KEY",
    :required    => true,
    :description => "access_key: aws_access_key, username, etc"

  option :secret_key,
    :short       => "-p secret_access_key",
    :long        => "--pass secret_access_key",
    :required    => true,
    :description => "secret_access_key: api_key, password, etc"

  option :bucket,
    :short       => "-b bucket",
    :long        => "--bucket bucket",
    :required    => true,
    :description => "bucket: Container where file is stored"

  option :file,
    :short       => "-f file_name",
    :long        => "--file file_name",
    :required    => true,
    :description => "File to download"

  option :destination,
    :short       => "-d destination",
    :long        => "--destination destination",
    :required    => true,
    :description => "Full path to download file (eg: /tmp/file.tar)"

  option :help,
    :short        => "-h",
    :long         => "--help",
    :description  => "Show this message",
    :on           => :tail,
    :boolean      => true,
    :show_options => true,
    :exit         => 0
end

#create a connection
cli = MyCLI.new
cli.parse_options

@credentials={}
case cli.config[:provider].downcase
when "aws"
  @credentials={
    :provider              => "AWS",
    :aws_access_key_id     => cli.config[:access_key],
    :aws_secret_access_key => cli.config[:secret_key]
  }

when "rackspace"
  @credentials={
    :provider           => "Rackspace",
    :rackspace_username => cli.config[:access_key],
    :rackspace_api_key  => cli.config[:secret_key]
  }

when "google"
  @credentials={
    :provider                         => "Google",
    :google_storage_access_key_id     => cli.config[:access_key],
    :google_storage_secret_access_key => cli.config[:secret_key]
  }
end

connection = Fog::Storage.new(@credentials)

bucket = connection.directories.get(cli.config[:bucket])
file   = bucket.files.get(cli.config[:file])
dest   = File.open(cli.config[:destination], "w")

dest.write(file.body)
dest.close
