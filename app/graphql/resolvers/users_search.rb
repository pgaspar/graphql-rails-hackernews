class Resolvers::UsersSearch < GraphQL::Function
  argument :contains, types.String

  type !types[Types::UserType]

  def call(_obj, args, ctx)
    scope = User.all
    return scope if args[:contains].blank?

    scope.where('name LIKE ?', "%#{args[:contains]}%")
      .or scope.where('email LIKE ?', "%#{args[:contains]}%")
  end
end
