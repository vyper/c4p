require_relative './sign_in_params'

module Web::Controllers::SignIn
  class Create
    include Web::Action

    params SignInParams

    def initialize(interactor: UserAuthenticator)
      @interactor = interactor
    end

    def call(params)
      return nil if !params.valid?

      result = @interactor.new(params: params).call

      if result.success?
        sign_in_and_redirect(result.user)
      else
        flash[:error] = result.error
        redirect_to routes.new_sign_in_path
      end
    end
  end
end
