require 'test_helper'

class Resolvers::SignInUserTest < ActiveSupport::TestCase
  def perform(args = {})
    Resolvers::SignInUser.new.call(nil, args, nil)
  end

  setup do
    @user = User.create!(
      name: 'test',
      email: 'email@example.com',
      password: 'something'
    )
  end

  test 'creates a token' do
    result = perform(
      email: @user.email,
      password: @user.password,
    )

    assert result.present?
    assert result.token.present?
    assert_equal result.user, @user
  end

  test 'handling no credentials' do
    assert_nil perform
  end

  test 'handling wrong email' do
    assert_nil perform(email: 'wrong')
  end

  test 'handling wrong password' do
    assert_nil perform(email: @user.email, password: 'wrong')
  end
end
