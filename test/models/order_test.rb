require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test "should not save order without quantity" do
    order = Order.new
    assert_not order.save, "Saved the customer without a quantity"
  end
end
