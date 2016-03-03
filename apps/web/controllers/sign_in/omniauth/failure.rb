module Web::Controllers::SignIn::Omniauth
  class Failure
    include Web::Action

    def call(params)
      # TODO flash[:notice] = 'facebook auth error'
      redirect_to routes.new_sign_in_path
    end
  end
end
