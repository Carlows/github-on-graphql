QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "The query root of the main schema"

  field :repositories, types[RepositoryType] do
    description "Repositories for User"
    argument :type, types.String

    resolve ->(obj, args, ctx) do
      # This connection expects an array of Repository objects
      # [Repository.new(
      #   id: '123',
      #   ...
      # )]
      Repository.fetch_repositories args[:type]
    end
  end
end
