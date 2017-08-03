require 'test_helper'

class Resolvers::CreateLinkTest < ActiveSupport::TestCase
  def perform(args = {})
    Resolvers::CreateLink.new.call(nil, args, { current_user: @user })
  end

  setup do
    @user = User.create!(
      name: 'test',
      email: 'email@example.com',
      password: 'something'
    )
  end

  test 'creating new link' do
    link = perform(
      url: 'http://example.com',
      description: 'description',
    )

    assert link.persisted?
    assert_equal link.description, 'description'
    assert_equal link.url, 'http://example.com'
    assert_equal link.user, @user
  end
end
