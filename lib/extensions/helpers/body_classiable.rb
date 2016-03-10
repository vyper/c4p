module Extensions
  module Helpers
    module BodyClassiable
      def body_class
        Hanami::Utils::String.new(self.class).
          dasherize.
          gsub('web/views/', '').
          gsub('/', ' ')
      end
    end
  end
end
