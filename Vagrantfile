require "yaml"
require "./src/tooler"

Vagrant.configure("2") do |config|
  config.vm.box = "archlinux/archlinux"
  scripts_path = "#{File.expand_path(File.dirname(__FILE__))}/scripts"
  config_path = "#{File.expand_path(File.dirname(__FILE__))}/config"

  tooler = Tooler.new(config, scripts_path, config_path)

  tooler.provision
end
