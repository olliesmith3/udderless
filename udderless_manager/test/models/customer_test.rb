require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save customer without email, first name, address line 1, postcode" do
    customer = Customer.new
    assert_not customer.save, "Saved the customer without an email, first name, address line 1, postcode"
  end

end
