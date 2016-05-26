class Organization
  attr_reader :service

  def initialize(user)
    @service ||= GithubServices.new(user)
  end

  def all
      orgs = service.orgs_array.map do |org|
        {name: org[:login], link: org[:url] }
      end
  end

end
