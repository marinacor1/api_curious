Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV["key1"], ENV["key2"]
end
