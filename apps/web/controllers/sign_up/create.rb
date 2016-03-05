require_relative './sign_up_params'

module Web::Controllers::SignUp
  class Create
    include Web::Action

    params SignUpParams

    expose :user, :errors

    def initialize(interactor = UserCreator)
      @interactor = interactor
    end

    def call(params)
      return nil if !params.valid?

      @result = @interactor.new(params: params).call
      @user = @result.user

      # TODO Redirect
    end

    # TODO DRY
    def errors
      if params.errors.any?
        params.errors
      elsif @result.errors.any?
        @result.errors
      end
    end
  end
end
