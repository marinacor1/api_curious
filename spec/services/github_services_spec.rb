require 'rails_helper'

describe GithubService do
  it "returns all starred repos", :vcr do
  service = GithubServices.new
  starred = service.starred 
  expect(starred.count).to eq(3)
end
end
