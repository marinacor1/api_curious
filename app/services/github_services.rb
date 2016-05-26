class GithubServices

  def initialize(user)
    @user = user
    @connection = Faraday.new(url: "https://api.github.com")
    @connection.headers[:Authorization] = "token #{@user['oauth_token']}"
  end

  def get_user
    @connection.get "/users/#{@user.screen_name}"
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_starred
    @connection.get "/user/starred"
  end

  def get_repos
    @connection.get "/user/repos"
  end

  def get_organizations
    @connection.get "organizations"
  end

  def get_following_feed
    @connection.get "users/#{@user.screen_name}/received_events"
  end

  def get_my_feed
    @connection.get "users/#{@user.screen_name}/events"
  end

  def get_contributions
    @connection.get "users/#{@user.screen_name}/contributions/"
  end

  def repo_hash
    parse(get_repos)
  end

  def star_hash
    stars = parse(get_starred)
    stars.map {|repo| repo[:name]}
  end

  def orgs_array
    orgs = parse(get_organizations)
  end

  def events_array
    parse(get_following_feed)
  end

  def my_events_array
    parse(get_my_feed)
  end
end
