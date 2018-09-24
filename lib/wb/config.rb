# frozen_string_literal: true

require "yaml"
require "wb/note"
require "wb/filename"

module WB
  class Config
    attr_reader :path

    def initialize(config_path)
      @path = config_path
      @config = YAML.safe_load(IO.read(config_path))
    end

    def notes
      local_notes = Dir[File.join(WB.config.project_root, "*")]
      global_notes = [WB.config.personal_workbook, WB.config.work_workbook]

      [*local_notes, *global_notes].each_with_index.map do |note, index|
        WB::Note.new(note, index)
      end
    end

    def working_hours
      @working_hours ||= workbook.fetch("working_hours").split("-")
    end

    def personal_workbook
      @personal_workbook ||= workbook.fetch("personal")
    end

    def work_workbook
      @work_workbook ||= workbook.fetch("work")
    end

    def project_root
      @project_root ||= project.fetch("note_folder")
    end

    def project_date_format
      @project_date_format ||= begin
        date_format = fetch_config(key: "date_format", default: DEFAULT_DATE_FORMAT)
        Filename.generate(date_format)
      end
    end

    def extension
      @extension ||= begin
        fetch_config(key: "extension", default: DEFAULT_EXTENSION_FORMAT)
      end
    end

    private

    attr_reader :config

    DEFAULT_DATE_FORMAT = "%F"
    private_constant :DEFAULT_DATE_FORMAT

    DEFAULT_EXTENSION_FORMAT = "md"
    private_constant :DEFAULT_EXTENSION_FORMAT

    def workbook
      @_workbook ||= config.fetch("workbook")
    end

    def project
      @_project ||= workbook.fetch("project")
    end

    def fetch_config(key:, default:)
      project.fetch(key) do
        workbook.fetch(key) do
          default
        end
      end
    end
  end
end
