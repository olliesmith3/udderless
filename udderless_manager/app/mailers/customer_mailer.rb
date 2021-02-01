class CustomerMailer < ApplicationMailer
  default from: ENV["GMAIL_USERNAME"]

  def welcome_email
    @url = 'http://example.com/order_oatmilk'
    @customer = params[:customer]
    mail(to: @customer.email, subject: 'Welcome to Udderless')
  end
end
