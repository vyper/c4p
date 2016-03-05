module Web::Controllers::SignIn::Omniauth
  class Failure
    include Web::Action

    def call(params)
      flash[:error] = 'Unexpected error' # TODO i18n?
      redirect_to routes.new_sign_in_path
    end
  end
end
