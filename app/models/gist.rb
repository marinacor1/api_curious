class Gist
  attr_reader :service

  def initialize(user)
    @service ||= GithubServices.new(user)
  end

  def all
    gists_array = service.gists_hash
    file_name = gists_array.map do |agist|
      {name: agist[:files].values.first[:filename], link: agist[:files].values.first[:raw_url]}
    end
  end
end
