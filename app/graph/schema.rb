Schema = GraphQL::Schema.define do
  query QueryType
  max_depth 10

  object_from_id ->(id, ctx) do
    type_name, object_id = GraphQL::Schema::UniqueWithinType.decode(id)
    Object.get_const(type_name).find(object_id)
  end

  id_from_object ->(obj, type, ctx) do
    GraphQL::Schema::UniqueWithinType.encode(
      type.name,
      obj.id
    )
  end

  resolve_type ->(obj, ctx) do
    Schema.types[obj.class.name]
  end
end
