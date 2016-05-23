require 'rails_helper'

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      provider: 'github'
      extra: {
        raw_info: {
          user_id: "1234",
          name: "Horace",
          screen_name: "worace"
        }
      },
      credentials: {
        token: "pizza",
        secret: "secretpizza"
      }
      })
  end

RSpec.feature "user logs in with github account" do
  scenario "user will see request to authorize access using github" do
    # user = User.create(id: "1", screen_name: "Cocoapuffs", uid: "123", oauth_token: "123", oauth_token_secret: "123", name: "User")
    visit "/"
    click_on "Sign in with Github"
    #stub out login
    expect(page).to eq root_path
    expect(page.status_code).to eq(200)
    expect(page).to have_content "#{user.name}"
  end
end
