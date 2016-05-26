class EventsController < ApplicationController
  def index
    event = Event.new(current_user)
    @events = event.all
  end
end
