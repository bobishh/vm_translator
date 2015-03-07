$LOAD_PATH.unshift File.dirname(__FILE__)

require 'vm_translator/parser'
require 'vm_translator/coder'

# main module
module VMTranslator
  def self.process(input, output)
    Coder.write(Parser.parse_file(input), output)
  end
end
