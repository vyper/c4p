require 'hanami/interactor'

class UserUpdater
  include Hanami::Interactor

  expose :user

  def initialize(user:, params:, repository: UserRepository)
    @user       = user
    @params     = params
    @repository = repository
  end

  def call
    persist_user
  end

  private

  def persist_user
    @user.update @params.get('user')
    @user = @repository.update(@user)
  rescue Hanami::Model::UniqueConstraintViolationError
    error! OpenStruct.new(attribute_name: :email, validation: 'already exists')
  end
end
