RepositoryType = GraphQL::ObjectType.define do
  name "Repository"
  description "A Repository object from Github"
  interfaces [GraphQL::Relay::Node.interface]

  global_id_field :id
  field :name, !types.String, "Name of the repository"
  field :description, !types.String, "Description of the repository"
  field :forks_count, !types.Int, "Amount of times this repository was forked"
  field :stargazers_count, !types.Int, "Amount of stars this repository has"
  field :private, !types.Boolean, "Is the repository private?"
  field :html_url, !types.String, "Full url to the repository"
end
