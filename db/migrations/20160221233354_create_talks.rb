Hanami::Model.migration do
  change do
    create_table :talks do
      primary_key :id, :uuid, default: Sequel.function(:uuid_generate_v4)

      foreign_key :event_id, :events, type: 'uuid', on_delete: :restrict, null: false
      foreign_key :author_id, :users, type: 'uuid', on_delete: :restrict, null: false

      column :name,        :citext,  null: false
      column :description, :citext,  null: false
      column :created_at,  DateTime, null: false
      column :updated_at,  DateTime, null: false
    end
  end
end
