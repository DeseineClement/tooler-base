module Providers
  def self.validate(provider_file)
    File.exists? provider_file and File.readable? provider_file
  end

  def self.configure(config, provider_file)
    YAML::load(File.read(provider_file)).each do |provider, attributes|
      config.vm.provider provider do |pr, override|
        pr.name = attributes["vm_name"] if attributes.has_key? "vm_name"
        override.vm.box = attributes["box"] if attributes.has_key? "box"
      end
    end
  end
end
