module Tooler
  autoload :Providers, File.expand_path("#{File.dirname(__FILE__)}/tooler/providers")
  autoload :Base, File.expand_path("#{File.dirname(__FILE__)}/tooler/base")

  def self.configure(config, ansible_dir, scripts_dir, providers, base)
    Providers.configure(config, providers)
    Base.configure(config, base, scripts_dir, ansible_dir)
  end
end
