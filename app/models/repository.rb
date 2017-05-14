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
    def fetch_repositories(type = '')
      github = Github.new oauth_token: "#{ENV['GITHUB_TOKEN']}"

      # current user repositories
      repositories = github.repos.list type: type

      # return an array of Repositories
      repositories.map do |data|
        hash = data.except!('size')

        Repository.new({
            id: hash['id'],
            name: hash['full_name'],
            description: hash['description'],
            forks_count: hash['forks_count'],
            stargazers_count: hash['stargazers_count'],
            private: hash['private'],
            html_url: hash['html_url']
        })
      end
    end
  end
end
