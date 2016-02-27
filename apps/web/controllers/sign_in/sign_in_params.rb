module Web::Controllers::SignIn
  class SignInParams < Web::Action::Params
    param :user do
      param :email,     presence: true
      param :password,  presence: true
    end
  end
end
