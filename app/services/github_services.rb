class GithubServices

  def initialize(oauth_token)
    @connection = Faraday.new(url: "https://api.github.com")
    @connection.headers["Authorization"] = "token #{oauth_token}"
  end

  def get_user
    @connection.get "/users/marinacor1"
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_image
    @connection.get "/users/marinacor1"
  end

  def user_hash
    parse(get_image)
  end


end
