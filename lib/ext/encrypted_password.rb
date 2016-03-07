require 'bcrypt'
require 'hanami/model/coercer'

class EncryptedPassword < Hanami::Model::Coercer
  def self.dump(value)
    BCrypt::Password.create(value)
  end

  def self.load(value)
    BCrypt::Password.new(value)
  end
end
