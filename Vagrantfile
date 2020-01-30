require File.expand_path("#{File.dirname(__FILE__)}/src/tooler.rb")
require 'yaml'

Vagrant.configure("2") do |config|
  config.vm.define "tooler-base"

  Tooler.configure(
      config,
      File.expand_path("#{File.dirname(__FILE__)}/scripts"),
      File.expand_path("#{File.dirname(__FILE__)}/ansible"),
      File.expand_path("#{File.dirname(__FILE__)}/config")
  )

end
