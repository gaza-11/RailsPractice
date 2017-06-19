require 'test_helper'

class ActorTest < ActiveSupport::TestCase
  test'actor can create' do
    actor = FactoryGirl.create(:actor)
    assert_not_nil actor
  end

  test 'actor not nil validate check' do
    actor = FactoryGirl.create(:actor)
    assert_not_nil actor.first_name
    assert_not_nil actor.last_name

    actor.first_name = nil
    actor.last_name = nil
    assert actor.invalid?
    assert actor.errors.include? :first_name
    assert actor.errors.include? :last_name
  end

  test 'actor length validate check' do
    actor = FactoryGirl.build :actor
    actor.first_name = ''
    actor.last_name = ''
    assert actor.invalid?
    assert actor.errors.include? :first_name
    assert actor.errors.include? :last_name

    actor.first_name = '123456789012345678901'
    actor.last_name = '123456789012345678901'
    assert actor.invalid?
    assert actor.errors.include? :first_name
    assert actor.errors.include? :last_name
  end

  test 'actor birthday must correct format' do
    actor = Actor.new
    actor.first_name = 'test'
    actor.last_name = 'test'
    actor.birthday = '2014/1/1/1'
    assert actor.invalid?
    assert actor.errors.include? :birthday

    actor.birthday = '2017/1/32'
    assert actor.invalid?
    assert actor.errors.include? :birthday

    actor.birthday = '2017/1'
    assert actor.invalid?
    assert actor.errors.include? :birthday
  end
end
