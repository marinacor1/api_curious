class EventsController < ApplicationController
  def index
    event = Event.new(current_user)
    @events = event.all
  end

  def show
    event = Event.new(current_user)
    @my_events = event.my_all
  end
end
