CollaboratorType = GraphQL::ObjectType.define do
  name "Collaborator"
  description "Dummy collaborator type"

  field :id, !types.ID, "Id of the collaborator"
  field :name, !types.String, "Name of the collaborator"
end
