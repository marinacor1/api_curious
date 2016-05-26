class WelcomeController < ApplicationController
  def show
    if current_user
      repo = Repo.new(current_user)
      @starred = repo.starred
      organization = Organization.new(current_user)
      @organizations = organization.all
      event = Event.new(current_user)
      @events = event.all

    end
  end
end
