Hanami::Model.migration do
  change do
    create_table :authentications do
      primary_key :id, :uuid, default: Sequel.function(:uuid_generate_v4)

      foreign_key :user_id, :users, type: 'uuid', on_delete: :restrict, null: false

      column :provider,    String,   null: false
      column :uid,         String,   null: false
      column :created_at,  DateTime, null: false
      column :updated_at,  DateTime, null: false

      index [:provider, :uid],      unique: true
      index [:provider, :user_id],  unique: true
    end
  end
end
