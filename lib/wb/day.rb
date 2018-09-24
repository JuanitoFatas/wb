require "time"

module WB
  class Day
    def self.working?
      now = Time.now
      date = now.strftime("%Y-%m-%d")
      from, to = WB.config.working_hours
      start_time = TimeUtils.get_beginning_of(from, within: date)
      end_time = TimeUtils.get_end_of(to, within: date)

      now.between?(start_time, end_time)
    end
  end

  class TimeUtils
    def self.get_beginning_of(hour, within:)
      Time.parse("#{within} #{hour}:00:00")
    end

    def self.get_end_of(hour, within:)
      Time.parse("#{within} #{hour}:59:59")
    end
  end
end
