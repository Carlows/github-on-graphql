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
    def github_client
      github = Github.new oauth_token: "#{ENV['GITHUB_TOKEN']}"
    end

    def fetch_repositories(type = '')
      github = github_client

      # current user repositories
      repositories = github.repos.list type: type

      # return an array of Repositories
      repositories.map do |data|
        Repository.new({
            id: data['id'],
            name: data['full_name'],
            description: data['description'],
            forks_count: data['forks_count'],
            stargazers_count: data['stargazers_count'],
            private: data['private'],
            html_url: data['html_url']
        })
      end
    end

    def create_repository(options)
      github = github_client
      repo = github.repos.create(options)

      Repository.new(
        id: repo['id'],
        name: repo['full_name'],
        description: repo['description'],
        forks_count: repo['forks_count'],
        stargazers_count: repo['stargazers_count'],
        private: repo['private'],
        html_url: repo['html_url']
      )
    end
  end
end
