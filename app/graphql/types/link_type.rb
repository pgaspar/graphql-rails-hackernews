Types::LinkType = GraphQL::ObjectType.define do
  name 'Link'

  field :id, !types.ID
  field :url, !types.String
  field :description, !types.String
  field :postedBy, -> { Types::UserType }, property: :user
  field :votes, -> { !types[Types::VoteType] }
end
