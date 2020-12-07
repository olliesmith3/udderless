class CustomersController < ApplicationController
  before_action :authenticate_user!, :check_staff

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
      redirect_to @customer
    else
      render 'new'
    end
  end

  def show
    @customer = Customer.find(params[:id])
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :address_line_1, :address_line_2, :town, :county, :postcode, :email, :tel)
  end

  def check_staff
    unless current_user.email == "ollie@udderless.co.uk"
      redirect_to root_path, notice: "You are not one of the boys" 
    end
  end

end
