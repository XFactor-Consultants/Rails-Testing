require "application_system_test_case"

class UserFlowsTest < ApplicationSystemTestCase
  test "showing users" do
    visit users_url
  
    assert_selector "h1", text: "Users"

    within (".user.Steve") do
      click_on "Show"
    end

    assert_selector "h4", text: "Steve"
  end

  test "registration" do
    visit root_url
    assert_selector "h2", text: "You are not logged in!"

    click_on "Sign Up"

    assert_selector ".actions", wait: 10

    fill_in "user_email", with: "stacey1337@aol.com"
    fill_in "user_name", with: "Stacey"
    fill_in "user_password", with: "Test123"
    fill_in "user_password_confirmation", with: "Test123"

    click_on "Create User"

    assert_selector "a", text: "Edit"
  end

  test "bad login" do 
    visit root_url
    assert_selector "h2", text: "You are not logged in!"
    click_on "Log In"
    fill_in "email", with: "stacey1337@aol.com"
    fill_in "password", with: "Stacey"
    click_on "Login"
    assert_selector "#alert", text: "Email or password is invalid"
  end
end
