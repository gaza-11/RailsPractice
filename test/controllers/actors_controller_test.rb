require 'test_helper'

class ActorsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get '/actors/'
    assert_response :success

    get '/'
    assert_response :success
  end

  test 'should get search' do
    get '/actors/search'
    assert_response :success
  end

  test 'should get new' do
    get '/actors/new'
    assert_response :success
  end

  test 'should get edit' do
    actor = FactoryGirl.create(:actor)
    get "/actors/#{actor.id}/edit/"
    assert_response :success
  end

  test 'should delete' do
    actor = FactoryGirl.create(:actor)
    delete "/actors/#{actor.id}"
    assert_redirected_to '/'
  end

  test 'should create'do
    post '/actors/', params: { actor: { first_name: 'FirstName', last_name: 'LastName', birthday: '2001/1/1' } }
    assert_redirected_to '/'
  end

  test 'should update(patch)' do
    actor = FactoryGirl.create(:actor)
    patch "/actors/#{actor.id}", params: { actor: { first_name: 'Updated', last_name: actor.last_name } }
    assert_redirected_to '/'
    assert_equal 'Updated', (Actor.find actor.id).first_name
  end

  test 'should update(put)' do
    actor = FactoryGirl.create(:actor)
    put "/actors/#{actor.id}", params: { actor: { first_name: 'Updated', last_name: actor.last_name } }
    assert_redirected_to '/'
    assert_equal 'Updated', (Actor.find actor.id).first_name
  end
end

