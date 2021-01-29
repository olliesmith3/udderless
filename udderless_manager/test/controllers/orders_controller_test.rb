require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    get '/users/sign_in'
    sign_in users(:one)
    post user_session_url

    @order = orders(:one)
    @customer = customers(:one)
  end

  test "should get orders for a customer" do
    get customer_orders_url(@customer)
    assert_response :success
  end

  test "should create order then redirect to customer's orders" do
    assert_difference('Order.count') do
      post customer_orders_url(@customer), params: { order: { quantity: @order.quantity, frequency: @order.frequency } }
    end

    assert_redirected_to customer_orders_url(@customer)
  end

  test "should get new order form" do
    get new_customer_order_url(@customer)
    assert_response :success
  end

  # Had issues with this test returning 404 - unsure why it was not locating the order. The problem was that I had not assigned the id for the customer in fixtures.
  test "should show order" do
    get customer_order_url(customer_id: @order.customer_id, id: @order.id)
    assert_response :success
  end

  test "should get edit" do
    get edit_customer_order_url(customer_id: @order.customer_id, id: @order.id)
    assert_response :success
  end

  test "should update order and redirect to show that order updated" do
    patch customer_order_url(customer_id: @order.customer_id, id: @order.id), params: { order: { quantity: @order.quantity, customer_id: @order.customer_id } }
    assert_redirected_to customer_order_url(customer_id: @order.customer_id, id: @order.id)
  end

  test "should destroy order and redirect to customer's orders" do
    assert_difference('Order.count', -1) do
      delete customer_order_url(customer_id: @order.customer_id, id: @order.id)
    end

    assert_redirected_to customer_orders_url(@customer)
  end

  test "should complete order" do
    put complete_order_url(customer_id: @order.customer_id, id: @order.id)
    assert_redirected_to customer_orders_url(@customer)
  end

  test "should undo complete order" do
    put undo_complete_order_url(customer_id: @order.customer_id, id: @order.id)
    assert_redirected_to customer_orders_url(@customer)
  end

  test "should cancel order" do
    put cancel_order_url(customer_id: @order.customer_id, id: @order.id)
    assert_redirected_to customer_orders_url(@customer)
  end

  test "should undo cancel order" do
    put undo_cancel_order_url(customer_id: @order.customer_id, id: @order.id)
    assert_redirected_to customer_orders_url(@customer)
  end
end
