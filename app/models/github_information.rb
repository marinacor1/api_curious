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
    user_array = GithubServices.new.user_hash(get_image)
    user_array.image
 end

 def self.find_starred
    user_array = GithubServices.new.star_hash
    user_array.starred_url
 end

 def self.find_repos
    temp_repo_hash = GithubServices.new.repo_hash
 end

end
