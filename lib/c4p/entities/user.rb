class User
  include Hanami::Entity

  attributes :email, :name, :encrypted_password, :created_at, :updated_at
end
