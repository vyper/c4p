module Extensions
  module Helpers
    module Flashable
      TYPES = %i(alert error notice success)

      def flash_message
        return nil if flash.empty?

        html do
          TYPES.each do |type|
            next if !flash[type]

            div class: "flash-#{type}" do
              span do
                flash[type]
              end
            end
          end
        end
      end
    end
  end
end
