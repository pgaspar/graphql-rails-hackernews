require 'test_helper'

class Resolvers::UsersSearchTest < ActiveSupport::TestCase
  def perform(args = {})
    Resolvers::UsersSearch.new.call(nil, args, nil)
  end

  test 'fetch all users' do
    user1 = User.create! name: 'Pedro', email: 'pedro@example.com', password: 'password'
    user2 = User.create! name: 'Ana', email: 'ana@example.com', password: 'password2'

    result = perform

    assert_equal result.sort, [user1, user2].sort
  end

  test 'search links' do
    user1 = User.create! name: 'John Smith', email: 'john_smith@example.com', password: 'password'
    user2 = User.create! name: 'J. Doe', email: 'john_doe@example.com', password: 'password2'
    User.create! name: 'Ana', email: 'ana@example.com', password: 'password3'

    result = perform(contains: 'john')

    assert_equal result.sort, [user1, user2].sort
  end
end
