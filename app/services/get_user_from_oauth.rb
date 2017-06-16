class GetUserFromOauth
  def initialize(auth)
    @auth = auth
  end

  def process
    find_or_create_user_provider
  end

  def self.for(auth)
    GetUserFromOauth.new(auth).process
  end

  private

  attr_reader :auth, :user

  def find_or_create_user_provider
    user_provider =
      UserProvider.find_by(provider: auth.provider, uid: auth.uid)

    if user_provider.blank?
      user = User.find_by(email: auth.info.email)

      if user.blank? && auth.info.email
        user = User.create!(
          email: auth.info.email,
          password: Devise.friendly_token[0, 20],
          name: auth.info.name,
          image: auth.info.image)
      end

      user_provider = user.user_providers.create!(
        provider: auth.provider,
        uid: auth.uid
      )
    end

    @user = user_provider.user
  end
end
