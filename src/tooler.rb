module Tooler
  autoload :Providers, File.expand_path("#{File.dirname(__FILE__)}/tooler/providers")

  def self.configure(config, providers)
    Providers.configure(config, providers)
  end
end
