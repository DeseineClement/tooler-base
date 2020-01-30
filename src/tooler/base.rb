module Base
  def self.validate(base_file, ansible_dir, scripts_dir)
    File.exists? base_file and File.readable? base_file and
    File.directory? ansible_dir and File.readable? ansible_dir and
    File.directory? scripts_dir and File.readable? scripts_dir
  end

  def self.configure(config, base_file, ansible_dir, scripts_dir)
    config.vm.provision "shell", path: "#{scripts_dir}/aptitude.sh"
    config.vm.provision "shell", path: "#{scripts_dir}/python3.sh"
    base = YAML::load(File.read(base_file))

    config.vm.provision :ansible do |ansible|
      ansible.playbook = "#{ansible_dir}/playbooks/base.yml"

      ansible.become = true
      ansible.become_user = "root"

      ansible.host_vars = {
        "tooler-base" => {
          :packages => "#{base["packages"]}",
        },
      } if base.has_key?("packages")
    end
  end
end
