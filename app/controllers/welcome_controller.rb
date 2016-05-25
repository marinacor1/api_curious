class WelcomeController < ApplicationController
  def show
    #gs = GithubServices.new(current_user)
    repo = Repo.new(current_user)
    @starred = repo.starred
    organization = Organization.new(current_user)
    @organizations = organization.all
  end
end
