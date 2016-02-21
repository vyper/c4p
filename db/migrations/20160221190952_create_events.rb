Hanami::Model.migration do
  change do
    create_table :events do
      primary_key :id, :uuid, default: Sequel.function(:uuid_generate_v4)
      foreign_key :owner_id, :users, type: 'uuid', on_delete: :restrict, null: false

      column :name,        :citext,    null: false
      column :description, :citext,    null: false
      column :tags,        'citext[]'
      column :created_at,  DateTime,   null: false
      column :updated_at,  DateTime,   null: false

      index :name, unique: true
    end
  end
end
