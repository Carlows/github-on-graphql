QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "The query root of the main schema"

  field :node, GraphQL::Relay::Node.field

  connection :repositories do
    type RepositoryType.connection_type
    description "Repositories for User"

    resolve ->(obj, args, ctx) do
      [Repository.new(
        id: '123',
        name: 'test',
        description: 'test',
        forks_count: 1,
        stargazers_count: 1,
        private: false,
        html_url: 'bla'
      )]
    end
  end
end
