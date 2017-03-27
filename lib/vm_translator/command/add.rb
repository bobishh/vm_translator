module VMTranslator
  module Command
    # represents add command
    class Add
      def to_asm
        "@SP\nA=M\nD=M\n@SP\nM=M-1\nA=M\nM=M+D\n"
      end

      def to_s
        "\\ add:\n#{to_asm}"
      end
    end
  end
end
