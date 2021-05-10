require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  test "should get create" do
    get login_path
    assert_response :success
  end

  test "should get destroy" do
    get logout_path
    assert_redirected_to root_path
  end

  
  
  
  
  # test "register" do
  #   create_user

  #   assert_redirected_to user_url(User.last)
  # end

  # test "login failure" do
  #   # create_user
  #   post sessions_url, params: {email: 'john.cena@gmail.com', password: 'secret'}
  #   assert_equal "Email or password is invalid", flash.now[:alert]
  # end

  # test "login success" do
  #   create_user
  #   post sessions_url, params: {email: 'john.cena@gmail.com', password: 'secret'}
  #   assert_redirected_to root_path
  # end

end
