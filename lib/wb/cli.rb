module WB
  class CLI
    def initialize(commands)
      @commands = commands
    end

    def run(arguments: ARGV)
      command = find_command(arguments[0])
      command.run(arguments[1])
    end

    private

    attr_reader :commands

    def find_command(name)
      command = find_command_by_name(name) || default_command
      command.new
    end

    def find_command_by_name(name)
      commands.find { |command| command.name == name }
    end

    def default_command
      commands.find { |command| command.name == "" }
    end
  end
end
