class Event
  include Hanami::Entity

  attributes :owner_id, :name, :description, :tags, :created_at, :updated_at
end
