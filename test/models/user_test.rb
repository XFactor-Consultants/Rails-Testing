require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "user_count" do
    assert_equal 4, User.count
  end
  test "user_factory" do
    user5 = create(:user, :password => '123')
    user6 = create(:user, :password => '123')
    # Rails::logger.debug User.pluck :id
    assert_equal 6, User.count
  end
  test "user_delete" do
    user5 = create(:user, :password => '123')
    user6 = create(:user, :password => '123')
    User.first.destroy()
    assert_equal 5, User.count
  end
end
