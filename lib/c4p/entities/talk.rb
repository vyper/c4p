class Talk
  include Hanami::Entity
  include Hanami::Validations

  attribute :event_id,    type: String,   presence: true
  attribute :author_id,   type: String,   presence: true
  attribute :name,        type: String,   presence: true
  attribute :description, type: String,   presence: true
  attribute :created_at,  type: DateTime
  attribute :updated_at,  type: DateTime
end
