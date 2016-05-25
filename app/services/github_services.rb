class GithubServices

  def initialize(user)
    @user = user
    @connection = Faraday.new(url: "https://api.github.com/")
    @connection.headers[:Authorization] = "token #{@user['oauth_token']}"
  end

  def get_user
    @connection.get "/users/marinacor1" #interpolate current_user.screen_name
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  # def get_image
  #   @connection.get "#{parse(get_user)[:avatar_url]}"
  #   #TODO I think these are wrong becasue the hashes don't have info
  # end
  #
  def get_starred
    @connection.get "/user/starred"
  end
  #
  def get_repos
    @connection.get "/user/repos"
    # @connection.get "#{parse(get_user)[:repos_url]}"
  end
  #
  # def get_followers
  #   @connection.get "#{parse(get_user)[:followers_url]}"
  # end
  #
  # def get_following
  #   @connection.get "#{parse(get_user)[:following_url]}"
  # end
  #
  # def get_organizations
  #   @connection.get "#{parse(get_user)[:organization_url]}"
  # end
  #
  # def get_feeds
  #   @connection.get "#{parse(get_user)[:feeds_url]}"
  # end
  #
  # def star_hash
  #   parse(get_starred)
  # end

  def repo_hash
    parse(get_repos)
  end

  def star_hash
   stars = parse(get_starred)
   stars.map {|repo| repo[:name]}
  end



end
