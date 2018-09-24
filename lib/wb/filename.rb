# frozen_string_literal: true

module WB
  class Filename
    def self.generate(format)
      Time.now.strftime(format)
    end
  end
end
