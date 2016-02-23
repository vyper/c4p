class Event
  include Hanami::Entity
  include Hanami::Validations

  attribute :owner_id,    type: String,   presence: true
  attribute :name,        type: String,   presence: true
  attribute :description, type: String,   presence: true
  attribute :tags,        type: Array
  attribute :created_at,  type: DateTime
  attribute :updated_at,  type: DateTime
end
