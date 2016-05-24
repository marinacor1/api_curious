class User < ActiveRecord::Base
  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user| #take the omniauth authentication info
      #read the user_id from the auth_info. if user exists with the uid value of that user_id then
      #we've found the person and can return her
      #otherwise create them:
      new_user.uid = auth_info.uid
      new_user.name = auth_info.info["name"]
      new_user.screen_name = auth_info.credentials.oauth_token
      new_user.oauth_token_secret = auth_info.credentials.oauth_token_secret
    end
  end
end
