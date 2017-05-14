class Repository
  attr_accessor :id, :name, :description, :forks_count, :stargazers_count, :private, :html_url

  def initialize(fields = {})
    @id = fields[:id]
    @name = fields[:name]
    @description = fields[:description]
    @forks_count = fields[:forks_count]
    @stargazers_count = fields[:stargazers_count]
    @private = fields[:private]
    @html_url = fields[:html_url]
  end

  class << self
    def all_repositores
        Github.new basic_auth: "#{ENV['GITHUB_LOGIN']}:#{ENV['GITHUB_PASSWORD']}"
    end
  end
end
