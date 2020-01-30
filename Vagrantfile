require File.expand_path("#{File.dirname(__FILE__)}/src/tooler.rb")
require 'yaml'

config_dir = File.expand_path("#{File.dirname(__FILE__)}/config")
tools_dir = "#{config_dir}/tools"
provider_config_file = "#{config_dir}/providers.yml"
base_config_file = "#{config_dir}/base.yml"

Vagrant.configure("2") do |config|
  config.vm.define "tooler-base"

  Tooler.configure(
      config,
      File.expand_path("#{File.dirname(__FILE__)}/scripts"),
      File.expand_path("#{File.dirname(__FILE__)}/ansible"),
      File.expand_path("#{File.dirname(__FILE__)}/config")
  )

end
