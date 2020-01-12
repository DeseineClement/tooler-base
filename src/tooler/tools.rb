module Tools
  def self.validate(tools_dir)
    File.directory? tools_dir and File.readable? tools_dir
  end

  def self.configure(config, tools_dir)
  end
end
