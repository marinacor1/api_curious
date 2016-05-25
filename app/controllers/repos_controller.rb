class ReposController < ApplicationController
  # before_action :initialize_repo

  def index
    repo = Repo.new(current_user)
    @repos = repo.all
  end

  private

    # def initialize_repo
    #   service = GithubServices.new(current_user)
    #   Repo.initialize_service(service)
    # end

end
