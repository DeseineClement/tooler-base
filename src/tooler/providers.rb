module Providers
  def self.configure(config, providers)
    providers.each do |provider, attributes|
      config.vm.provider provider do |pr, override|
        pr.name = attributes["vm_name"] if attributes.has_key? "vm_name"
        override.vm.box = attributes["box"] if attributes.has_key? "box"
      end
    end
  end
end
