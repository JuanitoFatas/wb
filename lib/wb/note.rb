# frozen_string_literal: true

module WB
  class Note
    attr_reader :path, :number

    def self.all
      WB.config.notes
    end

    def self.find_by_number(number)
      all.find { |note| note.number == number }
    end

    def self.find_by_full_path(full_path)
      all.find { |note| note.path == full_path }
    end

    def self.find_by_basename(basename)
      all.find { |note| File.basename(note.path) == basename }
    end

    def self.find_note(name)
      find_by_full_path(name) || find_by_basename(name)
    end

    def self.list_notes
      all.each { |note| $stdout.puts note }
    end

    def initialize(path, number)
      @path = path
      @number = number.to_s
    end

    def to_s
      %Q(#{number}: #{path})
    end
  end
end
