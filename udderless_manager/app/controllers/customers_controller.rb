class CustomersController < ApplicationController
  before_action :authenticate_user!, :check_staff
  before_action :set_customer, only: [:show, :edit, :update]

  def index
    check_staff
    @customers = Customer.all.order("created_at DESC")
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      # Tell the CustomerMailer to send a welcome email after save
      CustomerMailer.with(customer: @customer).welcome_email.deliver_later
      redirect_to @customer
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      redirect_to customer_path(@customer), notice: 'Customer was successfully updated.'
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :address_line_1, :address_line_2, :town, :county, :postcode, :email, :tel)
  end

  def check_staff
    unless ["ollie@udderless.co.uk", "luke@udderless.co.uk", "barny@udderless.co.uk"].include?( current_user.email )
      redirect_to root_path, notice: "You are not one of the boys" 
    end
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end

end
