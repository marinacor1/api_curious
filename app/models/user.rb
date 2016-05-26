class User < ActiveRecord::Base

  def self.from_omniauth(auth_info)
    new_user = where(uid: auth_info[:uid]).first_or_create
    new_user.followers = auth_info.extra.raw_info.followers
    new_user.following = auth_info.extra.raw_info.following
    new_user.image = auth_info.extra.raw_info.avatar_url
    new_user.uid = auth_info.uid
    new_user.name = auth_info.extra.raw_info.name
    new_user.screen_name = auth_info.info.nickname
    new_user.oauth_token = auth_info.credentials.token
    new_user.save
    return new_user
  end




end
