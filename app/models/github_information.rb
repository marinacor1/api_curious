class GithubInformation

  attr_accessor :id, :screen_name, :uid, :created_at, :updated_at, :name

  def initialize(user_hash)
    @id = user_hash[:id]
    @screen_name = user_hash[:screen_name]
    @uid = user_hash[:uid]
    @created_at = user_hash[:created_at]
    @updated_at = user_hash[:updated_at]
    @name = user_hash[:name]
  end

 def self.find_image
    user_array = GithubServices.new.user_hash
    user_array.image
 end

end
