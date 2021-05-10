require "application_system_test_case"

class ApplicationFlowsTest < ApplicationSystemTestCase
  setup do
    page.driver.browser.manage.window.resize_to(500, 1500)
  end
  test "login and view" do
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

    visit root_url
    take_screenshot
    click_on "Log In"
    fill_in "email", with: "stacey1337@aol.com"
    fill_in "password", with: "Test123"
    click_on "Login"

    assert_selector ".userCard.Stacey"
    within (".userCard.Stacey") do
      assert_selector "p", text: ""
    end

    click_on "Edit"
    assert_selector ".actions"

    fill_in "user_bio", with: "I'm just looking for the Jim to my Pam"
    click_on "Update User"
    assert_selector "a", text: "Edit"

    visit root_url
    take_screenshot
    assert_selector ".userCard.Stacey"
    within (".userCard.Stacey") do
      assert_selector "p", text: "I'm just looking for the Jim to my Pam"
    end
  end
end
