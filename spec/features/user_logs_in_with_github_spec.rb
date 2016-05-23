require 'rails_helper'

RSpec.feature "user logs in with github account" do
  scenario "user will see request to authorize access using github" do
    visit "/"
    expect(page.status_code).to eq(200)
  end
end
