# frozen_string_literal: true

require "fileutils"

module WB
  class Shell
    def self.run(*commands)
      $stdout.puts commands.join(" ")
      system *commands
    end

    def self.mkdir_p_touch(path)
      directories = File.dirname(path)
      filename = File.basename(path)
      unless File.exist?(directories)
        FileUtils.mkdir_p(directories)
      end
      FileUtils.touch(path)
      $stdout.puts "#{path} created"
    end

    def self.create_file(path)
      mkdir_p_touch(path)
      path
    end

    def self.open_file(path, editor: ENV["EDITOR"])
      run(editor, path)
    end

    def self.getc
      $stdin.getc
    end

    def self.append(path)
      file = File.open(path, "a")
      yield file
    ensure
      $stdout.puts "Wrote to #{file.path}"
      file.close
    end
  end
end
