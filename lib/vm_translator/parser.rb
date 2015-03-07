# frozen_string_literal: true

require 'vm_translator/command/builder'
require 'pry'

module VMTranslator
  # parses row and returns command
  class Parser
    MEMSEGMENTS = 'argument|local|static|constant|temp|point|this|that'.freeze
    COMMANDS = 'pop|push|add|neg|sub|eq|lt|gt'.freeze
    COMMAND_REGEXP = /\s*(?<command>#{COMMANDS})\s+(?<memspace>#{MEMSEGMENTS})\s+(?<value>\d+)\s*$/

    def initialize(rows)
      @raw = rows
    end

    def parsed
      @parsed ||= parse
    end

    private

    def parse
      @raw.map do |string|
        parse_string(string)
      end.compact
    end

    def parse_string(string)
      return nil unless string =~ COMMAND_REGEXP
      matched = string.match(COMMAND_REGEXP)
      Command::Builder.build(command: matched[:command],
                             memspace: matched[:memspace],
                             value: matched[:value])
    end
  end
end
