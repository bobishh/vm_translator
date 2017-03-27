require 'vm_translator/command/base'

module VMTranslator
  module Command
    # negation command class
    class Sub < Base
      def to_asm
        "@SP\nA=M\nD=M\n@SP\nM=M-1\nA=M\nM=M-D\n"
      end

      def to_s
        "\\ sub: #{to_asm}"
      end
    end
  end
end
