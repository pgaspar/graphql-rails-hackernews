Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  field :allLinks, function: Resolvers::LinksSearch.new
  field :allUsers, function: Resolvers::UsersSearch.new
end
