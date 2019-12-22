module ProvisionBase
  private def install_default_package(config)
    install_default_package_path = "#{@script_path}/base/install_default_packages.sh"

    @vagrant.vm.provision "shell",
                          path: install_default_package_path,
                          args: config.has_key?("packages") && config["packages"].instance_of?(Array) ? config["packages"] : []
  end

  private def setup_shell
    setup_shell_path = "#{@script_path}/base/setup_shell.sh"

    @vagrant.vm.provision "shell",
                          path: setup_shell_path,
                          privileged: false
  end

  private def provision_base(config)
    install_default_package(config)
    setup_shell
  end
end
