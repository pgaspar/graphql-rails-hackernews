require 'test_helper'

class Resolvers::CreateUserTest < ActiveSupport::TestCase
  def perform(args = {})
    Resolvers::CreateUser.new.call(nil, args, nil)
  end

  test 'creating new user' do
    user = perform(
      name: 'Test User',
      email: 'email@example.com',
      password: 'something',
    )

    assert user.persisted?
    assert_equal user.name, 'Test User'
    assert_equal user.email, 'email@example.com'
    assert user.authenticate('something')
  end

  test 'creating new user with existing email' do
    User.create! name: 'John', email: 'email@example.com', password: 'password'

    result = perform(
      name: 'John 2',
      email: 'email@example.com',
      password: 'something',
    )

    assert_equal result.class, GraphQL::ExecutionError
    assert result.message.include?('Invalid input')
  end
end
