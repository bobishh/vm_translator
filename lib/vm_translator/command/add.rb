require 'vm_translator/command/base'

module VMTranslator
  module Command
    # represents add command
    class Add < Base
      def to_asm
        'asm string for add'
      end
    end
  end
end
