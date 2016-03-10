module Web::Views::SignUp
  class Create
    include Web::View

    layout :simple

    template 'sign_up/new'
  end
end
