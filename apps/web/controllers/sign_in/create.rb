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
        flash[:success] = 'Signed in successfully' # TODO i18n?
        session[:logged_user_id] = result.user.id
        redirect_to routes.root_path
      else
        flash[:error] = result.error
        redirect_to routes.new_sign_in_path
      end
    end
  end
end
