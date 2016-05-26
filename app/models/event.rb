class Event
  attr_reader :service

  def initialize(user)
    @service ||= GithubServices.new(user)
  end

  def type_change(type)
    types = {"CreateEvent" => "created",
             "WatchEvent"  => "starred",
             "ForkEvent"   => "forked",
             "MemberEvent" => "added a collaborator to" }
    new_type = types[type]
  end

  def all
    temp_events_array = service.events_array
    temp_events_array.map do |event|
      {name: event[:actor][:login], type: type_change(event[:type]), repo_name: event[:repo][:name]}
    end
  end

  def my_all
    events = service.my_events_array

    all = events.map do |event|
      {repo: event[:repo][:name], url: event[:repo][:url], other: event}
    end
  end


end
