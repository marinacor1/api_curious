require 'rails_helper'

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      provider: 'github',
      extra: {
        raw_info: {
                    uid: "1234",
                    name: "Horace",
                    screen_name: "worace",
                    avatar_url: "ljsfls",
                    followers: "1",
                    following: "2",
                    starred_url: "lsjfs"
                    },

      },
      credentials: {
        oauth_token: "pizza",
        oauth_token_secret: "secretpizza"
      },
          info: {
            nickname: "lj"
          }
      })
  end

RSpec.feature "user logs in with github account" do
  scenario "user will see request to authorize access using github" do
    stub_omniauth
    visit "/"
    click_on "Sign in with Github"
    expect(page.status_code).to eq(200)
    expect(page).to have_content "Horace"
    expect(page).to have_link "Logout"
  end
end
