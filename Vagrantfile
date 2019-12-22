require "yaml"
require "./src/tooler"

vagrant_api_version = 2

Vagrant.configure(vagrant_api_version) do |config|
  config.vm.box = "archlinux/archlinux"
  scripts_path = "#{File.expand_path(File.dirname(__FILE__))}/scripts"
  config_path = "#{File.expand_path(File.dirname(__FILE__))}/config"

  tooler = Tooler.new(config, scripts_path, config_path)

  tooler.provision
end
