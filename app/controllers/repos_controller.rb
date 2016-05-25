class ReposController < ApplicationController

  def index
    repo = Repo.new(current_user)
    @repos = repo.all
  end



end
