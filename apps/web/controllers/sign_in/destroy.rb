module Web::Controllers::SignIn
  class Destroy
    include Web::Action

    def call(params)
      session[:logged_user_id] = nil
      redirect_to routes.root_path
    end
  end
end
