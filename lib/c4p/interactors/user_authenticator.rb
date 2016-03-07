require 'hanami/interactor'

class UserAuthenticator
  include Hanami::Interactor

  expose :user

  def initialize(params:, repository: UserRepository)
    @params     = params
    @repository = repository
  end

  def call
    @user = @repository.find_by_email(@params.get('user.email'))

    if !(@user && @user.password == @params.get('user.password'))
      error! 'Invalid e-mail or password'
    end
  end
end
