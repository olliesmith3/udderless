class CustomerMailer < ApplicationMailer
  default from: ENV["GMAIL_USERNAME"]

  def welcome_email
    @url = 'http://example.com/order_oatmilk'
    @customer = params[:customer]
    mail(to: @customer.email, subject: 'Welcome to Udderless')
  end

  def confirm_order
    @url = 'http://example.com/view_order'
    @customer = params[:customer]
    @order = params[:order]
    mail(to: @customer.email, subject: 'Your Udderless Oatmilk Order')
  end
end
