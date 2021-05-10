require 'test_helper'

class ApplicationFlowTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test 'application test' do
    assert_difference('User.count') do
      create    _user
    end

    assert_redirected_to user_url(User.last)
    follow_redirect!
    assert_response :success

    post sessions_url, params: {email: 'john.cena@gmail.com', password: 'secret'}
    assert_redirected_to root_path
    follow_redirect!
    assert_select ".userContainer", 1

    get users_url
    assert_response :success
    assert_select 'tr', 6

    assert_select 'tr:first-child > td:first-child', "Steve"
    assert_select 'tr:last-child > td:first-child', ""
    
    get user_path(User.all.last)
    assert_select '.email', "john.cena@gmail.com"

    patch user_path(User.all.last), params: {user: {name: "John Cena"}}
    assert_redirected_to user_path(User.all.last)
    follow_redirect!
    assert_select 'h4', "John Cena"
  end
end
