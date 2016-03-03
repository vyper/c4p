require 'hanami/interactor'

class OmniauthAuthenticator
  include Hanami::Interactor

  attr_reader :params, :authentication_repository, :user_repository

  expose :user, :redirect_to, :message

  def initialize(params:, authentication_repository: AuthenticationRepository, user_repository: UserRepository)
    @params                    = params
    @authentication_repository = authentication_repository
    @user_repository           = user_repository
  end

  def call
    if auth = authentication_repository.
                find_by_provider_and_uid(provider: omniauth_provider,
                                         uid: omniauth_uid)

      @user = user_repository.find(auth.user_id)

    elsif @user = user_repository.find_by_email(omniauth_email)
      auth = Authentication.new(user_id: @user.id,
                                provider: omniauth_provider,
                                uid: omniauth_uid)
      authentication_repository.create(auth)

    else
      # TODO: Sets user with pendent password
      @user = User.new(name: omniauth_name,
                      email: omniauth_email,
                      password: SecureRandom.hex)
      @user = user_repository.create(@user)

      auth = Authentication.new(user_id: @user.id,
                                provider: omniauth_provider,
                                uid: omniauth_uid)
      authentication_repository.create(auth)
    end

    @redirect_to = :root_path
    @message = 'Signed in successfully'
  end

  private

  def omniauth_uid
    params.env['omniauth.auth']['uid']
  end

  def omniauth_email
    omniauth_info['email']
  end

  def omniauth_name
    omniauth_info['name']
  end

  def omniauth_info
    params.env['omniauth.auth']['info']
  end

  def omniauth_provider
    params.get('provider')
  end
end
