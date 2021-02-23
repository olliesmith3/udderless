def sign_up
  visit root_url
  click_on "Sign Up"

  fill_in "Email", with: "ollie2@udderless.co.uk"
  fill_in("Password", :with => "udderless", match: :prefer_exact)
  fill_in "Password confirmation", :with => "udderless"

  click_on "Sign up" 
end