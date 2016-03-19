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
    if @user.password != @params.get('user.current_password')
      error! OpenStruct.new(attribute_name: :current_password, validation: 'password is invalid')
    end

    @user.update user_params
    @user = @repository.update(@user)
  rescue Hanami::Model::UniqueConstraintViolationError
    error! OpenStruct.new(attribute_name: :email, validation: 'already exists')
  end

  def user_params
    user_params ||= begin
      params = {
        name: @params.get('user.name'),
        email: @params.get('user.email')
      }

      if !@params.get('user.password').blank?
        params['password'] = @params.get('user.password')
      else
        params['password'] = @params.get('user.current_password')
      end

      params
    end
  end
end
