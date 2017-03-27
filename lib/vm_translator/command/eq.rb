require 'vm_translator/command/base'

module VMTranslator
  module Command
    # represents eq command
    class Eq < Base
      def to_asm
      end

      def to_s
        "\\ eq: #{to_asm}"
      end
    end
  end
end
