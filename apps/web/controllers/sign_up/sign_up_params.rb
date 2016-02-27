module Web::Controllers::SignUp
  class SignUpParams < Web::Action::Params
    param :user do
      param :name,      presence: true
      param :email,     presence: true
      param :password,  presence: true, confirmation: true
    end
  end
end
