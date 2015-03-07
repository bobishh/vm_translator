require 'vm_translator/command/base'

module VMTranslator
  module Command
    # represents pop command
    class Pop < Base
      DEF_TEMPLATE = "@%{value}\nD=A\n@%{segment}\nD=M+D\n@addr\nM=D\n@SP\nM=M-1\nA=M\nD=M\n@addr\nM=D\n"

      POINTER_TEMPLATE = "@SP\nM=M-1\nA=M\nD=M\n%{segment}\nM=D"

      def to_asm
        case @memspace
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
    end
  end
end
