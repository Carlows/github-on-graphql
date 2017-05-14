MutationType = GraphQL::ObjectType.define do
  name "Mutation"
  description "The root type for mutations"

  field :createRepository, field: RepositoryMutations::Create.field
end
