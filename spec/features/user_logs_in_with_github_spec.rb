require 'rails_helper'

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      provider: 'github',
      extra: {
        raw_info: {
          uid: "1234",
          name: "Horace",
          screen_name: "worace"
        }
      },
      credentials: {
        oauth_token: "pizza",
        oauth_token_secret: "secretpizza"
      }
      })
  end

RSpec.feature "user logs in with github account" do
  scenario "user will see request to authorize access using github" do
    # user = User.create(id: "1", screen_name: "Cocoapuffs", uid: "123", oauth_token: "123", oauth_token_secret: "123", name: "User")
    stub_omniauth
    visit "/"
    click_on "Sign in with Github"
    #stub out login
    # expect(page).to eq root_path
    expect(page.status_code).to eq(200)
    expect(page).to have_content "Horace"
    expect(page).to have_link "Logout"
  end
end
