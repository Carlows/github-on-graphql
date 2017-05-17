RepositoryType = GraphQL::ObjectType.define do
  name "Repository"
  description "A Repository object from Github"

  field :id, !types.ID, "Id of the repository"
  field :name, !types.String, "Name of the repository"
  field :description, types.String, "Description of the repository"
  field :forks_count, types.Int, "Amount of times this repository was forked"
  field :stargazers_count, types.Int, "Amount of stars this repository has"
  field :private, types.Boolean, "Is the repository private?"
  field :html_url, types.String, "Full url to the repository"

  field :collaborators do
    type types[CollaboratorType]
    description "Collaborators for this Repository"

    resolve ->(obj, args, ctx) do
      # obj will be the current Repository object
      Collaborator = Struct.new(:id, :name)

      [
        Collaborator.new(1, 'Donald'),
        Collaborator.new(2, 'Juan'),
        Collaborator.new(3, 'Abraham')
      ]
    end
  end
end
