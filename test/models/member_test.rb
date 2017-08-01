require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'login test' do
    member = FactoryGirl.create(:member, name: 'test_user', password: 'testtest', password_confirmation: 'testtest', admin_flag: false)
    assert_nil Member.authenticate 'test_user', 'aaaaaaaa'
    assert_equal member, Member.authenticate('test_user', 'testtest')
  end
end
