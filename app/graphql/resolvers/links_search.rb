class Resolvers::LinksSearch < GraphQL::Function
  argument :contains, types.String

  type !types[Types::LinkType]

  def call(_obj, args, ctx)
    scope = Link.all
    return scope if args[:contains].blank?

    scope.where('url LIKE ?', "%#{args[:contains]}%")
      .or scope.where('description LIKE ?', "%#{args[:contains]}%")
  end
end
