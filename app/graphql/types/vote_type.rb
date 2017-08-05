Types::VoteType = GraphQL::ObjectType.define do
  name 'Vote'

  field :id, !types.ID
  field :link, -> { !Types::LinkType }
  field :user, -> { !Types::UserType }
end
