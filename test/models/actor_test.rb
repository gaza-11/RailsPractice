require 'test_helper'

class ActorTest < ActiveSupport::TestCase
  test'actor can create' do
    actor = FactoryGirl.create(:actor)
    assert_not_nil actor
    # assert_equal 'Test1', actor.first_name
    # assert_equal 'User1', actor.last_name
  end
end
