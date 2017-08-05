class Resolvers::CreateVote < GraphQL::Function
  argument :linkId, !types.ID

  type Types::VoteType

  def call(_obj, args, ctx)
    Vote.create!(
      user: ctx[:current_user],
      link: Link.find_by(id: args[:linkId]),
    )
  rescue ActiveRecord::RecordInvalid => e
    GraphQL::ExecutionError.new(
      "Invalid input: #{e.record.errors.full_messages.join(', ')}"
    )
  end
end
