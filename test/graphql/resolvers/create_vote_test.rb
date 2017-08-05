require 'test_helper'

class Resolvers::CreateVoteTest < ActiveSupport::TestCase
  def perform(args = {})
    Resolvers::CreateVote.new.call(nil, args, { current_user: @user })
  end

  setup do
    @user = User.create!(
      name: 'test',
      email: 'email@example.com',
      password: 'something'
    )
    @link = Link.create!(
      url: 'http://google.com',
      description: 'description',
      user: @user,
    )
  end

  test 'creating new vote' do
    vote = perform(
      linkId: @link.id,
    )

    assert vote.persisted?
    assert_equal vote.link, @link
    assert_equal vote.user, @user
  end
end
