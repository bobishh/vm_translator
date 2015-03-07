require 'vm_translator/command/base'

module VMTranslator
  module Command
    # represents push command
    class Push < Base
      DEF_TEMPLATE = "@%{value}\nD=A\n@%{segment}\nD=M+D\n@addrM=D\nA=M\nD=M\n@SP\nA=M\nM=D\n@SP\nM=M+1\n"

      POINTER_TEMPLATE = "@%{segment}\nD=M\n@SP\nM=D\n@SP\nM=M+1"

      def to_asm
        case @memspace
        when 'constant' then constant
        when 'pointer' then pointer
        else default
        end
      end

      private

      def def_template
        DEF_TEMPLATE
      end

      def pointer_template
        POINTER_TEMPLATE
      end

      def constant
        "@%{value}\nD=A\n@SP\nA=M\nM=D\n@SP\nM=M+1" % { value: @value }
      end
    end
  end
end
