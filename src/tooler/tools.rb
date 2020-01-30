module Tools
  def self.validate(tools_dir, ansible_dir)
    File.directory? tools_dir and File.readable? tools_dir and
    File.directory? ansible_dir and File.readable? ansible_dir
  end

  def self.configure(config, tools_dir, ansible_dir)
    Dir["#{tools_dir}/*{.yml,.yaml}"].each do |tool_file|
      YAML::load(File.read(tool_file)).each do |tool_config|
        config.vm.provision :ansible do |ansible|
          ansible.playbook = "#{ansible_dir}/playbooks/#{File.basename(tool_file, ".*").downcase}.yml"
          ansible.become = true
          ansible.become_user = "root"
          ansible.host_vars = {
            "tooler-base" => tool_config,
          }
        end
      end
    end
  end
end
