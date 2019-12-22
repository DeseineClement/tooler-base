require "./src/provision_base"
require "./src/provision_tools"

class Tooler
  include ProvisionBase, ProvisionTools

  def initialize(vagrant, script_path, config_path)
    @vagrant = vagrant
    @script_path = script_path
    @config_path = config_path
  end

  private def load_config(name)
    config_file = "#{@config_path}/#{name}.yaml"
    raise "#{name.capitalize} config file does not exists, looked at #{config_file}" unless File.exist?(config_file)

    config = YAML.load(File.read(config_file))
    raise "Invalid tool config file" unless config.instance_of?(Hash)

    config
  end

  def provision
    provision_base load_config "base"
    provision_tools load_config "tools"
  end
end
