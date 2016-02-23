require 'bcrypt'

class User
  include Hanami::Entity
  include Hanami::Validations

  attributes :encrypted_password

  attribute :email, type: String,
                    presence: true,
                    format: /\A[^@\s]+@([^@\s]+\.)+[^@\W]+\z/
  attribute :name,                type: String,   presence: true
  attribute :password,            type: String,   presence: true
  attribute :created_at,          type: DateTime
  attribute :updated_at,          type: DateTime

  #
  # methods
  #
  def password
    return nil if encrypted_password.nil?

    @password ||= BCrypt::Password.new(encrypted_password)
  end

  def password=(password)
    if password.to_s.empty?
      @password = nil
      @encrypted_password = nil
    else
      @password = BCrypt::Password.create(password)
      @encrypted_password = @password
    end
  end
end
