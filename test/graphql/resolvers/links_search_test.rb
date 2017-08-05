require 'test_helper'

class Resolvers::LinksSearchTest < ActiveSupport::TestCase
  def perform(args = {})
    Resolvers::LinksSearch.new.call(nil, args, nil)
  end

  def user
    @_user ||= User.create! name: 'test', email: 'test@example.com', password: 'password'
  end

  def create_link(**attributes)
    Link.create! attributes.merge(user: user)
  end

  test 'fetch all links' do
    link1 = create_link description: 'description-1', url: 'http://link-1.com'
    link2 = create_link description: 'description-2', url: 'http://link-2.com'

    result = perform

    assert_equal result.sort, [link1, link2].sort
  end

  test 'search links' do
    link1 = create_link description: 'First', url: 'http://test.com'
    link2 = create_link description: 'Second (Test)', url: 'http://example.com'
    create_link description: 'Third', url: 'http://something.com'

    result = perform(contains: 'test')

    assert_equal result.sort, [link1, link2].sort
  end
end
