module VMTranslator
  # writes commands to assembler
  class Coder
    def initialize(commands)
      @commands = commands
    end

    def self.write(input, output)
      file = File.open(output, 'w')
      coder = new(input)
      file.write(coder.transform_commands)
      file.close
    end

    def transform_commands
      @commands.map do |cmd|
        transform_command(cmd)
      end.join "\n"
    end

    private

    def transform_command(cmd)
      cmd.to_asm
    end
  end
end
