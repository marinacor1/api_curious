class Repo
  attr_reader :service

  def initialize(user)
    @service ||= GithubServices.new(user)
  end

  # def self.service(user)
  # end

  # def self.initialize_service(service)
  #   @service = service
  # end

  def all
    repo_array = service.repo_hash
    repo_array.map do |repo|
      {name: repo[:name], link: repo[:html_url]}
    end
  end

  def starred
    starred_repo_array = service.star_hash
  end

end
