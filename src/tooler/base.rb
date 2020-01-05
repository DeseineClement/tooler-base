module Base
  def self.configure(config, base, scripts_dir, ansible_dir)
    config.vm.provision "shell", path: "#{scripts_dir}/aptitude.sh"
    config.vm.provision "shell", path: "#{scripts_dir}/python3.sh"
  end
end