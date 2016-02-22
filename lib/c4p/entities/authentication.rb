class Authentication
  include Hanami::Entity

  attributes :user_id, :provider, :uid, :created_at, :updated_at
end
