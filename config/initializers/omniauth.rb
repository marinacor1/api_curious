Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linkedin, "key1", "key2"
end
