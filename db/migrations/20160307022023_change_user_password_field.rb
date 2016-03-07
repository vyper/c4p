Hanami::Model.migration do
  change do
    alter_table :users do
      rename_column :encrypted_password, :password
    end
  end
end
