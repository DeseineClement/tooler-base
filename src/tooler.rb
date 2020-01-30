module Tooler
  autoload :Providers, File.expand_path("#{File.dirname(__FILE__)}/tooler/providers")
  autoload :Base, File.expand_path("#{File.dirname(__FILE__)}/tooler/base")
  autoload :Tools, File.expand_path("#{File.dirname(__FILE__)}/tooler/tools")

  def self.configure(config, scripts_dir, ansible_dir, conf_dir)
    provider_file = "#{conf_dir}/providers.yml"
    base_file = "#{conf_dir}/base.yml"
    tools_dir = "#{conf_dir}/tools"

    Providers.configure(config, provider_file) if Providers.validate(provider_file)
    Base.configure(config, base_file, ansible_dir, scripts_dir) if Base.validate(base_file, scripts_dir, ansible_dir)
    Tools.configure(config, tools_dir, ansible_dir) if Tools.validate(tools_dir, ansible_dir)
  end
end
