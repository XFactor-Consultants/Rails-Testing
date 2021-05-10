require 'test_helper'

class UserFlowTest < ActionDispatch::IntegrationTest
  test "registration" do
    assert_difference('User.count') do
      create_user
    end

    assert_redirected_to user_url(User.last)
    follow_redirect!
    assert_response :success

    post sessions_url, params: {email: 'john.cena@gmail.com', password: 'secret'}
    assert_redirected_to root_path

  end

  test "invalid user" do
    post sessions_url, params: {email: 'john.cena@gmail.com', password: 'secret'}
    assert_response :success
    assert_equal "Email or password is invalid", flash.now[:alert]
    get root_path
    assert_select 'h2', 'You are not logged in!'
  end

  test "valid user" do 
    create_user
    post sessions_url, params: {email: 'john.cena@gmail.com', password: 'secret'}
    assert_redirected_to root_path
    follow_redirect!
    assert_select 'a', "Edit"
  end
end
