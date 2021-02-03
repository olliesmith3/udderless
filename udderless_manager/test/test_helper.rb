ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'simplecov'

SimpleCov.start 'rails' do
  add_filter '/lib/mapbox_api_spike.rb' # this spike is not supposed to be tested
end

class ActiveSupport::TestCase
  include Devise::Test::IntegrationHelpers
  include Warden::Test::Helpers

  def log_in(user)
    if integration_test?
      # use warden method
      login_as(user, :scope => :user)
    else
      # use devise helper
      sign_in(user)
    end
  end
  
  # Run tests in parallel with specified workers
  #parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

# class ActionController::TestCase
#   include Devise::TestHelpers
# end