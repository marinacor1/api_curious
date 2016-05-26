class Event
  attr_reader :service

  def initialize(user)
    @service ||= GithubServices.new(user)
  end

  def type_change(type)
    if type == "CreateEvent"
      new_type = "created"
    elsif type == "WatchEvent"
      new_type = "starred"
    elsif type == "ForkEvent"
      new_type = "forked"
    elsif type == "MemberEvent"
      new_type = "added a collaborator to"
    else
      type = new_type
    end
    new_type
  end

  def all
    temp_events_array = service.events_array
    temp_events_array.map do |event|
      {name: event[:actor][:login], type: type_change(event[:type]), repo_name: event[:repo][:name]}
    end
  end

  def my_all
    events = service.my_events_array
  end

end
