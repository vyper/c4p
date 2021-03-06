class User
  include Hanami::Entity
  include Hanami::Validations

  attribute :email, type: String,
                    presence: true,
                    format: /\A[^@\s]+@([^@\s]+\.)+[^@\W]+\z/
  attribute :name,       type: String,  presence: true
  attribute :password,                  presence: true
  attribute :created_at, type: DateTime
  attribute :updated_at, type: DateTime
end
