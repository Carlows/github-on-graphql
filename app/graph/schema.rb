Schema = GraphQL::Schema.define do
  query QueryType
  mutation MutationType
  max_depth 10
end
