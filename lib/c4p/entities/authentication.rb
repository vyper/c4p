class Authentication
  include Hanami::Entity
  include Hanami::Validations

  attribute :user_id,     type: String,   presence: true
  attribute :provider,    type: String,   presence: true
  attribute :uid,         type: String,   presence: true
  attribute :created_at,  type: DateTime
  attribute :updated_at,  type: DateTime
end
