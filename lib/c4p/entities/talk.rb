class Talk
  include Hanami::Entity

  attributes :event_id, :author_id, :name, :description, :created_at, :updated_at
end
