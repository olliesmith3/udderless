class OrdersController < ApplicationController
  before_action :get_customer, :authenticate_user!, :check_staff
  before_action :set_order, only: [:show, :edit, :update, :destroy, :complete, :undo_complete, :cancel, :undo_cancel]

  # GET /orders
  # GET /orders.json
  def index
    @orders = @customer.orders.order("created_at DESC")
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = @customer.orders.build
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = @customer.orders.build(order_params)

    if @order.save
      # Tell the CustomerMailer to send an order confirmation email after save
      CustomerMailer.with(customer: @customer, order: @order).confirm_order.deliver_later
      redirect_to customer_orders_path(@customer), notice: 'Order was successfully created.' 
    else
      render :new 
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    if @order.update(order_params)
      redirect_to customer_order_path(@customer), notice: 'Order was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    redirect_to customer_orders_path(@customer), notice: 'Order was successfully destroyed.'
  end

  def complete
    @order.completed = true
    @order.save
    redirect_to customer_orders_path(@customer)
  end

  def undo_complete
    @order.completed = false
    @order.save
    redirect_to customer_orders_path(@customer)
  end

  def cancel
    @order.cancelled = true
    @order.save
    redirect_to customer_orders_path(@customer)
  end

  def undo_cancel
    @order.cancelled = false
    @order.save
    redirect_to customer_orders_path(@customer)
  end

  private

  def check_staff
    unless ["ollie@udderless.co.uk", "luke@udderless.co.uk", "barny@udderless.co.uk"].include?( current_user.email )
      redirect_to root_path, notice: "You are not one of the boys" 
    end
  end

  def get_customer
    @customer = Customer.find(params[:customer_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = @customer.orders.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def order_params
    params.require(:order).permit(:quantity, :customer_id, :frequency, :completed, :cancelled, :created_by)
  end
end
