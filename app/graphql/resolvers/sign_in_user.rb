class Resolvers::SignInUser < GraphQL::Function
  argument :email, !types.String
  argument :password, !types.String

  type do
    name 'SignInPayload'

    field :token, types.String
    field :user, Types::UserType
  end

  def call(_obj, args, ctx)
    # Basic validation
    return unless args[:email] && args[:password]

    user = User.find_by email: args[:email]

    # Ensure this is the right user
    return unless user
    return unless user.authenticate(args[:password])

    # Build a token
    crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base.byteslice(0..31))
    token = crypt.encrypt_and_sign("user-id:#{ user.id }")

    ctx[:session][:token] = token

    OpenStruct.new(user: user, token: token)
  end
end
