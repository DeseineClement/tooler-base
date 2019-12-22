module ProvisionTools
  private def provision_tools(config)
    config.each do |tool, versions|
      versions.each {
        |version|
        tool_script_path = "#{@script_path}/tools/#{tool}.sh"

        raise "Invalid configuration for #{tool}" unless version.instance_of?(Hash) && version.has_key?("name")
        raise "Script file does not exists for #{tool}, looked at #{scripts_path}/#{tool}.sh" unless File.exist?(tool_script_path)

        version["default"] = version.has_key?("default") && version["default"] == true ? 1 : 0

        @vagrant.vm.provision "shell",
                              path: tool_script_path,
                              args: version.values
      }
    end
  end
end
