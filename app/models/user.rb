class User < ActiveRecord::Base
  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid = auth_info.uid
      new_user.name = auth_info.extra.raw_info
      new_user.screen_name = auth_info.extra.raw_info.screen_name
      new_user.oauth_token_secret = auth_info.credentials.oauth_token_secret
    end
  end

  # def self.get_user(auth)
  #   User.where(provider: auth[:provider], uid: auth[:uid]).first_or_create do |user|
  #     user.nickname = auth[:info][:nickname]
  #     user.email = auth[:info][:email]
  #     user.image = auth[:info][:image]
  #     user.token = auth[:credentials][:token]
  #     user.save!
  #   end
  # end
end
