require "application_system_test_case"
require_relative "../helpers/user_helpers"

class UsersTest < ApplicationSystemTestCase
  test "User Sign up then Sign Out" do
    sign_up
    click_on "Log out"
    assert_text "Signed out successfully."
  end
end
