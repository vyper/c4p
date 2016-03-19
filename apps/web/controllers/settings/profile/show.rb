module Web::Controllers::Settings
  module Profile
    class Show
      include Web::Action

      before :authenticate!

      expose :user

      def call(params)
        @user = current_user
      end
    end
  end
end
