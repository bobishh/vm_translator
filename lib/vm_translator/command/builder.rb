require 'vm_translator/command/pop'
require 'vm_translator/command/push'

module VMTranslator
  module Command
    # builds a command
    class Builder
      attr_reader :command

      def initialize(command, memspace, value)
        @command = inferred_class(command).new(memspace, value)
      end

      def self.build(command:, memspace:, value:)
        new(command, memspace, value).command
      end

      def inferred_class(command)
        Kernel.const_get "VMTranslator::Command::#{command.capitalize}"
      end
    end
  end
end
