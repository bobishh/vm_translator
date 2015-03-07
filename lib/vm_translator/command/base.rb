module VMTranslator
  module Command
    # represents base command
    class Base
      DEF_SEGMENTS = {
        local: 'LCL',
        argument: 'ARG',
        this: 'THIS',
        that: 'THAT'
      }.freeze

      def initialize(memspace, value)
        @memspace = memspace
        @value = value
      end

      def to_asm
        raise NonImplementedError, 'Needs to be implemented on child'
      end

      protected

      def default
        def_template % { segment: segment, value: @value }
      end

      def segment
        DEF_SEGMENTS[@memspace.to_sym]
      end

      def pointer
        pointer_template % { segment: pointer_segment }
      end

      def pointer_segment
        case @value.to_i
        when 0 then 'THIS'
        when 1 then 'THAT'
        end
      end
    end
  end
end
