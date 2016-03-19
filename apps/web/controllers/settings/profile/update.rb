module Web::Controllers::Settings
  module Profile
    class Update
      include Web::Action

      before :authenticate!

      params do
        param :user do
          param :name,              presence: true
          param :email,             presence: true
          param :password,          confirmation: true
          param :current_password,  presence: true
        end
      end

      expose :user, :errors

      def initialize(interactor: UserUpdater)
        @interactor = interactor
      end

      def call(params)
        @user = params.get('user')
        return nil if !params.valid?

        @result = @interactor.new(user: current_user, params: params).call
        @user = @result.user

        if @result.success?
          flash[:success] = 'Profile updated successfully' # TODO i18n?
        end
      end

      # TODO DRY
      def errors
        if params.errors.any?
          params.errors
        elsif @result.errors.any?
          @result.errors
        else
          []
        end
      end
    end
  end
end
