module RepositoryMutations
  Create = GraphQL::Relay::Mutation.define do
    name "CreateRepository"
    description "Creates a new Repository for the authenticated user"

    input_field :name, !types.String
    input_field :description, !types.String
    input_field :private, types.Boolean
    input_field :has_issues, types.Boolean
    input_field :has_downloads, types.Boolean

    return_field :repository, RepositoryType

    resolve ->(obj, inputs, ctx) do
      begin
        repository = Repository.create_repository(inputs.to_h)
      rescue => error
        return GraphQL::ExecutionError.new(error)
      end

      { repository: repository }
    end
  end
end
