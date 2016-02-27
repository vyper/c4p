require 'hanami/interactor'

class UserCreator
  include Hanami::Interactor

  expose :user

  def initialize(params:, repository: UserRepository)
    @user       = User.new(params.get('user'))
    @repository = repository
  end

  def call
    persist_user
  end

  private

  def persist_user
    @user = @repository.create(@user)
  rescue Hanami::Model::UniqueConstraintViolationError
    error! OpenStruct.new(attribute_name: :email, validation: 'already exists')
  end
end
