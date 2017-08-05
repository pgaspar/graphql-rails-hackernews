Types::UserType = GraphQL::ObjectType.define do
  name 'User'

  field :id, !types.ID
  field :name, !types.String
  field :email, !types.String
  field :links, -> { !types[Types::LinkType] }
  field :votes, -> { !types[Types::VoteType] }
end
