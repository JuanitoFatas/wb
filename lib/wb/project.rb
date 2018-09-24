# frozen_string_literal: true

module WB
  class Project
    def self.root
      WB.config.project_root
    end

    def self.new_note(name)
      filename = [WB.config.project_date_format, name].compact.join("-")
      File.join(root, "#{filename}.#{WB.config.extension}")
    end
  end
end
