module Web::Controllers::SignIn::Omniauth
  class Success
    include Web::Action

    def initialize(interactor: OmniauthAuthenticator)
      @interactor = interactor
    end

    def call(params)
      result = @interactor.new(params: params).call

      if result.success?
        session[:logged_user_id] = result.user.id
      end

      # TODO flash[:notice] = result.message
      redirect_to routes.public_send(result.redirect_to)
    end
  end
end
