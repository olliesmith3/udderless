class Api::CustomerPortalV1::InterestsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def index
    render json: Interest.all
  end

  def create
    interest = Interest.create(interest_params)
    render json: interest
  end

  private

  def interest_params
    params.require(:interest).permit(:first_name, :postcode, :email, :tel)
  end
end