module Base
  def self.configure(config, base, ansible_dir, scripts_dir)
    config.vm.provision "shell", path: "#{scripts_dir}/aptitude.sh"
    config.vm.provision "shell", path: "#{scripts_dir}/python3.sh"

    config.vm.provision :ansible do |ansible|
      ansible.playbook = "#{ansible_dir}/playbooks/base.yml"

      ansible.become = true
      ansible.become_user = "root"

      ansible.host_vars = {
          "tooler-base" => {
              :packages => "#{base["packages"]}"
          }
      } if base.has_key?("packages")
    end
  end
end
