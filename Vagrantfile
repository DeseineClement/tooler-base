require File.expand_path("#{File.dirname(__FILE__)}/src/tooler.rb")
require 'yaml'

config_dir = File.expand_path("#{File.dirname(__FILE__)}/config")
provider_config_file = "#{config_dir}/providers.yml"
base_config_file = "#{config_dir}/base.yml"

scripts_dir = File.expand_path("#{File.dirname(__FILE__)}/scripts")
ansible_dir = File.expand_path("#{File.dirname(__FILE__)}/ansible")

Vagrant.configure("2") do |config|
  config.vm.define "tooler-base"

  Tooler.configure(
      config,
      scripts_dir,
      ansible_dir,
      (File.exist? provider_config_file) ? YAML::load(File.read(provider_config_file)) : {},
      (File.exist? base_config_file) ? YAML::load(File.read(base_config_file)) : {}
  )

end
