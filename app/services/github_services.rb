class GithubServices

  def initialize(oauth_token)
    @connection = Faraday.new(url: "https://api.github.com")
    @connection.headers["Authorization"] = "token #{oauth_token}"
  end

  def get_user
    @connection.get "/users/marinacor1/"
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_image
    @connection.get "#{parse(get_user)[:url]}"
  end

  def get_starred
    @connection.get "#{parse(get_user)[:starred_url]}"
  end

  def get_repos
    @connection.get "#{parse(get_user)[:repos_url]}"
  end

  def get_followers
    @connection.get "#{parse(get_user)[:followers_url]}"
  end

  def get_following
    @connection.get "#{parse(get_user)[:following_url]}"
  end

  def get_organizations
    @connection.get "#{parse(get_user)[:organization_url]}"
  end

  def get_feeds
    @connection.get "#{parse(get_user)[:feeds_url]}"
  end

  def user_hash
    parse(get_image)
  end


end
