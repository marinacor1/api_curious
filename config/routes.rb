Rails.application.routes.draw do
  root "welcome#show"
  get "/auth/github", as: :github_login
  get "/auth/github/callback", to: "sessions#create"

  get "/user/repos", to: "repos#index", as: :repos
  get "/user/organizations", to: "organizations#index", as: :organizations
  get "/user/events", to: "events#index", as: :events

  delete "/logout", to: "sessions#destroy", as: :logout

end
