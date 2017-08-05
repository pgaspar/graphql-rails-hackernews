class Resolvers::CreateUser < GraphQL::Function
  argument :name, !types.String
  argument :email, !types.String
  argument :password, !types.String

  type Types::UserType

  def call(_obj, args, _ctx)
    User.create!(
      name: args[:name],
      email: args[:email],
      password: args[:password],
    )
  rescue ActiveRecord::RecordInvalid => e
    GraphQL::ExecutionError.new(
      "Invalid input: #{e.record.errors.full_messages.join(', ')}"
    )
  end
end
