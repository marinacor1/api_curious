class Event
  attr_reader :service

  def initialize(user)
    @service ||= GithubServices.new(user)
  end

  def all
    temp_events_array = service.events_array
    temp_events_array.map do |event|
      {name: event[:actor][:login], type: event[:type], repo_name: event[:repo][:name]}
    end
  end
end
