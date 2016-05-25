class WelcomeController < ApplicationController
  def show
    #gs = GithubServices.new(current_user)
    repo = Repo.new(current_user)
    @starred = repo.starred
  end
end
