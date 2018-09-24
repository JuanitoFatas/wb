# frozen_string_literal: true
require "etc"

require "wb/version"
require "wb/config"
require "wb/cli"
require "wb/project"
require "wb/shell"
require "wb/day"
require "wb/config_template"

module WB
  def self.default_config
    File.join(Etc.getpwuid.dir, ".workbookrc")
  end

  def self.config(path: default_config)
    @config ||= Config.new(path)
  end
end
