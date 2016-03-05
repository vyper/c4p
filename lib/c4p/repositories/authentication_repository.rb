class AuthenticationRepository
  include Hanami::Repository

  def self.find_by_provider_and_uid(provider:, uid:)
    query do
      where(provider: provider, uid: uid)
    end.first
  end
end
