# Configure your routes here
# See: http://www.rubydoc.info/gems/hanami-router/#Usage

get  '/sign-in', to: 'sign_in#new',     as: :new_sign_in
post '/sign-in', to: 'sign_in#create',  as: :sign_in

get  '/sign-up', to: 'sign_up#new',     as: :new_sign_up
post '/sign-up', to: 'sign_up#create',  as: :sign_up

get  '/',        to: 'events#index',    as: :root
