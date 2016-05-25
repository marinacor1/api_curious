class User < ActiveRecord::Base

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      binding.pry
      new_user.image = auth_info.info.image
      new_user.uid = auth_info.uid
      new_user.name = auth_info.extra.raw_info.name
      # new_user.info = auth_info.extra.raw_info
      # new_user.blog = auth_info.info.urls["Blog"]
      # new_user.screen_name = auth_info.info.nickname
      new_user.screen_name = auth_info.extra.raw_info.screen_name
      new_user.oauth_token = auth_info.credentials.token
      # new_user.basic_info = auth_info.extra.raw_info
    end
  end


end
