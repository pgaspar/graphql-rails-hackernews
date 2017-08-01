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
  end
end
