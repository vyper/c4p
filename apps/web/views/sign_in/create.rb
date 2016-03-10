module Web::Views::SignIn
  class Create
    include Web::View

    layout :simple

    template 'sign_in/new'
  end
end
