Hanami::Model.migration do
  change do
    alter_table :users do
      set_column_type :email, :citext
    end
  end
end
