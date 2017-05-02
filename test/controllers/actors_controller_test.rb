require 'test_helper'

class ActorsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get '/actors/'
    assert_response :success
  end

  test 'should get search' do
    get '/actors/search'
    assert_response :success
  end

  test 'should get new' do
    get '/actors/new/'
    assert_response :success
  end

  test 'should get edit' do
    actor = FactoryGirl.create(:actor)
    get "/actors/#{actor.id}/edit/"
    assert_response :success
  end
end
