require "application_system_test_case"
require_relative "../helpers/user_helpers"

class UsersTest < ApplicationSystemTestCase
  test "visiting the homepage" do
    visit root_url
  
    assert_selector "h1", text: "Welcome"
  end

  test "User Sign Up" do
    sign_up
    assert_text "Welcome! You have signed up successfully."
  end
end
