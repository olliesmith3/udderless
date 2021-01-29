require 'test_helper'

class CustomersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    get '/users/sign_in'
    sign_in users(:one)
    post user_session_url

    @customer = customers(:one)
  end

  test "should get customers" do
    get customers_url
    assert_response :success
  end

  test "should create customer then redirect to show customer" do
    assert_difference('Customer.count') do
      post customers_url, params: { customer: { first_name: @customer.first_name, address_line_1: @customer.address_line_1, postcode: @customer.postcode, email: @customer.email } }
    end

    assert_redirected_to customer_url(Customer.last)
  end

  test "should get new customer form" do
    get new_customer_url
    assert_response :success
  end

  test "should show customer" do
    get customer_url(@customer)
    assert_response :success
  end

  test "should get edit customer form" do
    get edit_customer_url(@customer)
    assert_response :success
  end

  test "should update customer and redirect to show that customer updated" do
    @customer_two = customers(:two)
    patch customer_url(@customer), params: { customer: { first_name: @customer_two.first_name, address_line_1: @customer_two.address_line_1, postcode: @customer_two.postcode, email: @customer_two.email } }
    assert_redirected_to customer_url(@customer)
  end

  test "should destroy customer and redirect to  customers" do
    assert_difference('Customer.count', -1) do
      delete customer_url(@customer)
    end

    assert_redirected_to customers_url
  end
end
